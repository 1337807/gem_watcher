class AddHomepageUriToJem < ActiveRecord::Migration
  def change
    add_column :jems, :homepage_uri, :text
  end
end
