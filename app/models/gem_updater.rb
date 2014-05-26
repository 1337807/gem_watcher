class GemUpdater
  GEM_ATTRIBUTES = ['version', 'homepage_uri']
  def self.update_gems!
    new.update_gems!
  end

  def initialize(service = nil)
    @service = service || GemService.new
  end

  def update_gems!
    Jem.all.each do |gem|
      gem_data = @service.fetch_gem_data(gem.name)
      gem_data.keep_if { |k,v| GEM_ATTRIBUTES.include? k }

      if gem['version']
        gem.update_attributes(
          version:          gem_data['version'],
          previous_version: gem.version
        )
      end
    end
  end
end
