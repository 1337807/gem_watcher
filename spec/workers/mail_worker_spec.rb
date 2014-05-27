require 'spec_helper'
require 'sidekiq/testing'

describe MailWorker do
  xit "sends unsent notification" do
    VCR.use_cassette('mail_worker') do
      notification = Fabricate(:notification, sent: false)

      Sidekiq::Testing.inline! do
        MailWorker.perform_async
      end

      notification.reload
      expect(notification.sent).to be_true
      expect(ActionMailer::Base.deliveries.length).to eql(1)
    end
  end
end
