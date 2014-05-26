class GemUpdater
  def self.update_gems!
    new.update_gems!
  end

  def initialize(service = nil)
    @service = service || GemService.new
  end

  def update_gems!
    Jem.all.each do |gem|
      @service.fetch_gem_data(gem.name)
    end
  end
end
