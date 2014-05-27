class GemNotification < ActiveRecord::Base
  belongs_to :jem
  belongs_to :user
  belongs_to :notification
end
