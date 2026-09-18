| conf | class | method | check | file:line | warn_type | cwe_id | message | fingerprint | verdict | note |
|---|---|---|---|---|---|---|---|---|---|---|
| High |  |  | ForgerySetting | app/controllers/application_controller.rb:2 | Cross-Site Request Forgery | [352] | `protect_from_forgery` should be called in `ApplicationController` | 6f5239fb |  |  |
| High |  |  | CrossSiteScripting | app/views/layouts/application.html.erb:427 | Cross-Site Scripting | [79] | Unescaped cookie value | febb21e4 |  |  |
| High | DashboardController | change_graph | Send | app/controllers/dashboard_controller.rb:16 | Dangerous Send | [77] | User controlled method execution | 46e6c67a | Confirmed |  |
| High | BenefitFormsController | download | SendFile | app/controllers/benefit_forms_controller.rb:13 | File Access | [22] | Parameter value used in file name | f63861a0 | Confirmed |  |
| High |  |  | ValidationRegex | app/models/user.rb:13 | Format Validation | [777] | Insufficient validation for `email` using `/.+@.+\..+/i`. Use `\A` and `\z` as anchors | a21418b3 | Confirmed |  |
| High | UsersController | user_params_without_password | PermitAttributes | app/controllers/users_controller.rb:55 | Mass Assignment | [915] | Potentially dangerous key allowed for mass assignment | 753fe105 |  |  |
| High | SessionsController | create | Redirect | app/controllers/sessions_controller.rb:26 | Redirect | [601] | Possible unprotected redirect | 2170a24c |  |  |
| High | BenefitFormsController | download | UnsafeReflection | app/controllers/benefit_forms_controller.rb:12 | Remote Code Execution | [470] | Unsafe reflection method `constantize` called on parameter value | ff21c7fa |  |  |
| High | Api::V1::MobileController | index | UnsafeReflection | app/controllers/api/v1/mobile_controller.rb:17 | Remote Code Execution | [470] | Unsafe reflection method `constantize` called on parameter value | 71abb51a |  |  |
| High | Api::V1::MobileController | show | UnsafeReflection | app/controllers/api/v1/mobile_controller.rb:10 | Remote Code Execution | [470] | Unsafe reflection method `constantize` called on parameter value | ba6443b7 |  |  |
| High | UsersController | update | SQL | app/controllers/users_controller.rb:29 | SQL Injection | [89] | Possible SQL injection | 7fe86927 |  |  |
| High |  |  | SessionSettings | config/initializers/secret_token.rb:8 | Session Setting | [798] | Session secret should not be included in version control | 715ad9c0 |  |  |
| High |  |  | SessionSettings | config/initializers/session_store.rb:4 | Session Setting | [1004] | Session cookies should be set to HTTP only | 686c3e9f |  |  |
| Medium | Benefits | Benefits.make_backup | Execute | app/models/benefits.rb:15 | Command Injection | [77] | Possible command injection | b07b623a |  |  |
| Medium |  |  | JSONEntityEscape | config/environments/production.rb:2 | Cross-Site Scripting | [79] | HTML entities in JSON are not escaped by default | 8275f584 |  |  |
| Medium | UsersController | user_params | MassAssignment | app/controllers/users_controller.rb:50 | Mass Assignment | [915] | Specify exact keys allowed for mass assignment instead of using `permit!` which allows any keys | 9f34c0a2 |  |  |
| Medium | PasswordResetsController | reset_password | Deserialize | app/controllers/password_resets_controller.rb:6 | Remote Code Execution | [502] | `Marshal.load` called with parameter value | 07f51439 |  |  |
| Medium | Analytics | hits_by_ip | SQL | app/models/analytics.rb:3 | SQL Injection | [89] | Possible SQL injection | 27033d08 |  |  |
| Weak |  |  | EOLRails | Gemfile.lock:667 | Unmaintained Dependency | [1104] | Support for Rails 8.0.4 ends on 2026-11-07 | 21ab0fe0 |  |  |
