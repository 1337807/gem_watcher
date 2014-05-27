class AddVersionToGemNotification < ActiveRecord::Migration
  def change
    add_column :gem_notifications, :version, :string
  end
end
