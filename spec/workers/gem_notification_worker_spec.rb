require 'spec_helper'
require 'sidekiq/testing'

describe GemNotificationWorker do
  xit "creates a gem notification for each updated gem if it doesn't exist" do
    gem = Fabricate(:jem, version: '0.1')
    gem_notification = Fabricate(:gem_notification, jem: gem)
    gem.increment_version!

    VCR.use_cassette('gem_notification_worker') do
      Sidekiq::Testing.inline! do
        GemNotificationWorker.perform_async
      end

      expect(GemNotification.all.length).to eql(2)
      expect(GemNotification.all.map(&:version)).to eql(['0.1', '0.2'])
    end
  end
end
