require 'spec_helper'

describe ListParser do
  let(:parser) { ListParser.new }

  it "parses a given list body into a list of gem names" do
    result = parser.parse_gem_names("a\nb\nc\n")
    expect(result).to eql(['a', 'b', 'c'])
  end
end
