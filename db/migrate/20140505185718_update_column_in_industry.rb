class UpdateColumnInIndustry < ActiveRecord::Migration

  def change
    change_column :industries, :name, :string, null: false
  end

end
