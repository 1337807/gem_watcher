class GemUpdateWorker
  include Sidekiq::Worker

  def perform
    GemUpdater.update_gems!
  end
end
