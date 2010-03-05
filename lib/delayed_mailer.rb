require 'active_support'
require 'action_mailer'
require 'action_mailer/version'

require 'delayed_mailer/deliver'

if ActionMailer::VERSION::MAJOR < 3
  ActionMailer::Base.send(:include, DelayedMailer::Deliver)
end