class AddUrlToLists < ActiveRecord::Migration
  def change
    add_column :lists, :url, :text
  end
end
