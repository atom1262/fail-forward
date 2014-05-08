class AddsNullToImprovementsTable < ActiveRecord::Migration
  def change
    change_column_null :improvements, :post_id, false
  end
end
