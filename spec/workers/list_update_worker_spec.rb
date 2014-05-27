require 'spec_helper'
require 'sidekiq/testing'

describe ListUpdateWorker do
  it "creates a list_gem for every gem in every list" do
    VCR.use_cassette('list_update_worker') do
      list = Fabricate(:list, body: "a\nb\nc\n")
      list2 = Fabricate(:list, body: "d\ne\nf\n")

      Sidekiq::Testing.inline! do
        ListUpdateWorker.perform_async
      end

      expect(list.jems.map(&:name)).to eql(['a', 'b', 'c'])
      expect(list2.jems.map(&:name)).to eql(['d', 'e', 'f'])
    end
  end
end
