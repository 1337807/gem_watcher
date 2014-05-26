require 'spec_helper'

describe GemUpdater do
  before :all do
    @service = GemService.new
  end

  it "fetches a version for each gem" do
    Fabricate(:jem, name: 'rake', version: '0.1')
    Fabricate(:jem, name: 'rack', version: '0.1')
    @service.should_receive(:fetch_version).with('rake')
    @service.should_receive(:fetch_version).with('rack')
    GemUpdater.new(@service).update_gem_versions!
  end
end
