class AddColumnToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :improved_at, :datetime
  end
end
