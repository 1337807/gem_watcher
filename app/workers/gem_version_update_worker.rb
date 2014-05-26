class GemVersionUpdateWorker
  include Sidekiq::Worker

  def perform
    # update each gem version with the latest from rubygems
    GemUpdater.update_gem_versions!
  end
end
