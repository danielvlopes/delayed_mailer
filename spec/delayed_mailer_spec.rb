# coding: utf-8
require File.dirname(__FILE__) + '/spec_helper'

ActionMailer::Base.delivery_method = :test

class AsynchTestMailer < ActionMailer::Base

  def test_mail(from, to)
    @subject    = 'subject'
    @body       = 'mail body'
    @recipients = to
    @from       = from
    @sent_on    = Time.now
    @headers    = {}
  end
end

describe AsynchTestMailer do
  before do
    Object.const_set 'RAILS_ENV', 'test' unless defined?(::RAILS_ENV)
  end

  before(:each) do
    @emails = ActionMailer::Base.deliveries
    @emails.clear
    @params = 'noreply@myapp.com', 'jonh@doe.com'
    AsynchTestMailer.stub(:send_later)
  end

  describe 'deliver_test_mail' do
    it 'should not deliver the email at this moment' do
      AsynchTestMailer.deliver_test_mail *@params
      @emails.size.should == 0
    end

    it 'should send deliver action to delayed job list' do
      AsynchTestMailer.should_receive(:send_later).with('deliver_test_mail!', *@params)
      AsynchTestMailer.deliver_test_mail *@params
    end
  end

  describe 'deliver_test_mail!' do
    it 'should deliver the mail now' do
      AsynchTestMailer.deliver_test_mail! *@params
      @emails.size.should == 1
    end
  end

end