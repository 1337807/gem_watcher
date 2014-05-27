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

  context "List#update!" do
    it "updates and parses the body if the list has a url"
  end

  context "List#update_body!" do
    it "updates the body from the url"
  end

  context "List#parse_body!" do
    it "parses the body into gems and gem_lists"
  end
end
