unless ActionMailer::Base.ancestors.include?(DelayedMailer::Deliver)
  ActionMailer::Base.send(:include, DelayedMailer::Deliver)
end