require 'spec_helper'

describe GemService do
  context "fetch_gem_data" do
    let(:service) { GemService.new }

    it "should fetch details for a gem given the name" do
      VCR.use_cassette('gem_service') do
        result = service.fetch_gem_data('rake')
        result.keep_if { |k,v| ['name', 'version', 'authors'].include? k }

        expected = {
          "name"=>"rake",
          "version"=>"10.3.2",
          "authors"=>"Eric Hodel, Jim Weirich"
        }

        expect(result).to eql(expected)
      end
    end

    it "should fetch details for each of the gems in a given list"
  end
end
