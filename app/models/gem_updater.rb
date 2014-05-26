class GemUpdater
  def self.update_gem_versions!
    new.update_gem_versions!
  end

  def initialize(service = nil)
    @service = service || GemService.new
  end

  def update_gem_versions!
    Jem.all.each do |gem|
      @service.fetch_version(gem.name)
    end
  end
end
