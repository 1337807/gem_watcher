require 'spec_helper'

describe GemVersionUpdateWorker do
  it "should update a gem with a new version" do
    gem = Fabricate(:gem, name: 'rake', version: '0.1')

    Sidekiq::Testing.inline! do
      GemVersionUpdateWorker.perform_async
    end

    expect(gem.version).to eql('0.2')
    expect(gem.previous_version).to eql('0.1')
  end
end
