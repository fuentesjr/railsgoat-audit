#!/usr/bin/env ruby
# frozen_string_literal: true

require 'json'

COLUMNS = %w[conf class method check file:line warn_type cwe_id message fingerprint verdict note].freeze
CONF_RANK = { 'High' => 0, 'Medium' => 1, 'Weak' => 2 }.freeze

def cell(value)
  value.to_s.gsub('|', '\\|').gsub(/\s+/, ' ').strip
end

def row(values)
  "| #{values.map { |v| cell(v) }.join(' | ')} |"
end

def load_priors(path)
  return {} unless File.exist?(path)

  File.readlines(path, chomp: true).each_with_object({}) do |line, acc|
    next unless line =~ /\| ([0-9a-f]{8}) \| [^|]* \| [^|]* \| ([^|]*) \| ([^|]*) \|\s*\z/

    acc[Regexp.last_match(1)] = [Regexp.last_match(2).strip, Regexp.last_match(3).strip]
  end
end

report = ARGV[0] || Dir['scans/brakeman_report_*.json'].max
abort 'no Brakeman JSON report found' unless report && File.exist?(report)

out = ARGV[1] || 'triage.md'
priors = load_priors(out)
warnings = JSON.parse(File.read(report)).fetch('warnings')

warnings.sort_by! do |warning|
  [
    CONF_RANK.fetch(warning['confidence'], 9),
    warning['warning_type'].to_s
  ]
end

lines = [
  row(COLUMNS),
  "|#{(['---'] * COLUMNS.size).join('|')}|"
]

warnings.each do |warning|
  fp = warning.fetch('fingerprint')[0, 8]
  verdict, note = priors.fetch(fp, ['', ''])
  loc = warning['location'] || {}
  lines << row([
                 warning['confidence'],
                 loc['class'],
                 loc['method'],
                 warning['check_name'],
                 "#{warning['file']}:#{warning['line']}",
                 warning['warning_type'],
                 warning['cwe_id'],
                 warning['message'],
                 fp,
                 verdict,
                 note
               ])
end

File.write(out, "#{lines.join("\n")}\n")
warn "wrote #{warnings.size} warnings from #{report} to #{out}"
