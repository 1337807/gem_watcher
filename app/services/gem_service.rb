require 'gems'

class GemService
  attr_reader :client

  def initialize
    @client = Gems
  end

  def fetch_gem_data(gem_name)
    client.info(gem_name)
  end
end
