require 'spec_helper'
require 'sidekiq/testing'

describe ListUpdateWorker do
  it "creates a list_gem for every gem in every list" do
    VCR.use_cassette('list_update_worker') do
      list = Fabricate(:list, url: "https://gist.githubusercontent.com/1337807/3ee043101ce996e97478/raw/e0485c8b34ced8ce153f0ef3cc1f395c30ee12dd/gem_watcher_test_list")
      list2 = Fabricate(:list, url: "https://gist.githubusercontent.com/1337807/249898536f4e2e8e873a/raw/e796de1b809ca9295dc3f6751b983196f08dd705/gem_watcher_list_2")

      Sidekiq::Testing.inline! do
        ListUpdateWorker.perform_async
      end

      expect(list.jems.map(&:name)).to eql(['rake', 'rack'])
      expect(list2.jems.map(&:name)).to eql(['rspec', 'vcr'])
      expect(ListGem.count).to eql(4)
    end
  end
end
