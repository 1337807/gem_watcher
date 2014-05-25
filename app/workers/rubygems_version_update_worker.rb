class RubygemsVersionUpdateWorker
  include Sidekiq::Worker

  def perform
    # update each gem version with the latest from rubygems
  end
end
