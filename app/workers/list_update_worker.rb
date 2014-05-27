class ListUpdateWorker
  include Sidekiq::Worker

  def perform
    List.update_all!
  end
end
