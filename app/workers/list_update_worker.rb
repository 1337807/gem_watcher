class ListUpdateWorker
  include Sidekiq::Worker

  def perform
    # update each list
  end
end
