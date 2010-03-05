require 'active_support'
require 'action_mailer'
require 'action_mailer/version'

require 'delayed_mailer/deliver'

if ActionMailer::VERSION::MAJOR < 3
  require 'delayed_mailer/rails2_hook'
else
  require 'delayed_mailer/rails3_hook'
end