require 'active_support'
require 'action_mailer'
require 'action_mailer/version'

require 'delayed/mailer'

if ActionMailer::VERSION::MAJOR < 3
  ActionMailer::Base.send(:include, Delayed::Mailer)
end
