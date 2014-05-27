class CreateGemNotifications < ActiveRecord::Migration
  def change
    create_table :gem_notifications do |t|
      t.integer :user_id
      t.integer :notification_id
      t.integer :jem_id

      t.timestamps
    end
  end
end
