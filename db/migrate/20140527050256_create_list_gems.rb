class CreateListGems < ActiveRecord::Migration
  def change
    create_table :list_gems do |t|
      t.integer :list_id
      t.integer :jem_id

      t.timestamps
    end
  end
end
