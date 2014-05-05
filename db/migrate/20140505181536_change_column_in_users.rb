class ChangeColumnInUsers < ActiveRecord::Migration

  def change
    remove_column :users, :industry
    add_column :users, :industry_id, :integer, null: false
  end

end
