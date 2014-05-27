class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.boolean :sent

      t.timestamps
    end
  end
end
