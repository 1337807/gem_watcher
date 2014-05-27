class MailWorker
  include Sidekiq::Worker

  def perform
    # send an email for each unsent notification
  end
end
