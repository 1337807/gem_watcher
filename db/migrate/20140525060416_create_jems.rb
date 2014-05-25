class CreateJems < ActiveRecord::Migration
  def change
    create_table :jems do |t|
      t.string :name
      t.string :version
      t.string :previous_version

      t.timestamps
    end
  end
end
