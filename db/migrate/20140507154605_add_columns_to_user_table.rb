class AddColumnsToUserTable < ActiveRecord::Migration
  def change
    add_column :users, :formatted_name, :string
    add_column :users, :picture_url, :string
  end
end
