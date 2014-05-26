require 'spec_helper'

describe GemUpdater do
  before :all do
    @service = GemService.new
  end

  it "fetches new versions for each gem" do
    Fabricate(:jem, name: 'rake', version: '0.1')
    Fabricate(:jem, name: 'rack', version: '0.1')
    @service.should_receive(:fetch_gem_data).with('rake')
    @service.should_receive(:fetch_gem_data).with('rack')
    GemUpdater.new(@service).update_gems!
  end
end
