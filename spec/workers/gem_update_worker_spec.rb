require 'spec_helper'
require 'sidekiq/testing'

describe GemUpdateWorker do
  it "should update a gem with a new version" do
    VCR.use_cassette('gem_update_worker') do
      gem = Fabricate(:jem, name: 'rake', version: '0.1')

      Sidekiq::Testing.inline! do
        GemUpdateWorker.perform_async
      end

      gem.reload
      expect(gem.version).to eql('10.3.2')
      expect(gem.previous_version).to eql('0.1')
    end
  end
end
