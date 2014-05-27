require 'spec_helper'

describe List do
  let(:body) { Faker::Lorem.words(10).join("\r") }
  let(:url) { Faker::Internet.url }

  it "can be created with a url and without a body" do
    List.create(url: url)
    expect(List.last.url).to eql(url)
  end

  it "can be created with a body and without a url" do
    List.create(body: body)
    expect(List.last.body).to eql(body)
  end

  it "can be created with both a body and a url" do
    List.create(body: body, url: url)
    expect(List.last.url).to eql(url)
    expect(List.last.body).to eql(body)
  end

  it "can't be created without either a body or a url" do
    List.create
  end

  it "updates the list immediately after creation"

  context "List.update_all!" do
    it "updates the body of each list from the url" do
      VCR.use_cassette('list_update') do
        list = Fabricate(:list, url: 'https://gist.githubusercontent.com/1337807/3ee043101ce996e97478/raw/e0485c8b34ced8ce153f0ef3cc1f395c30ee12dd/gem_watcher_test_list')
        List.update_all!
        expect(list.jems.map(&:name)).to eql(['rake', 'rack'])
        expect(ListGem.count).to eql(2)
      end
    end
  end

  context "List#update_body!" do
    it "updates the body from the url" do
      VCR.use_cassette('list_update_body') do
        list = Fabricate(:list, url: 'https://gist.githubusercontent.com/1337807/3ee043101ce996e97478/raw/e0485c8b34ced8ce153f0ef3cc1f395c30ee12dd/gem_watcher_test_list')
        list.update_body!
        expect(list.body).to eql("rake\nrack")
      end
    end
  end

  context "List#parse_body!" do
    it "parses the body into gems and gem_lists" do
      list = Fabricate(:list, body: "a\nb\nc\n")
      list.parse_body!
      expect(Jem.all.map(&:name)).to eql(['a', 'b', 'c'])
      expect(ListGem.count).to eql(3)
    end
  end
end
