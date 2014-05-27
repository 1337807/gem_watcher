class GemNotificationWorker
  include Sidekiq::Worker

  def perform
    # create a gem notification for each updated gem for each user, unless one
    # already exists.
    # After creating all of the gem notifications generate an unselt
    # notification for each user and their gem notifications.
    # Finally start the mail worker to send all of the notifications.
  end
end
