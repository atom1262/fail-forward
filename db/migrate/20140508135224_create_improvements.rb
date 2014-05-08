class CreateImprovements < ActiveRecord::Migration
  def change
    create_table :improvements do |t|
      t.text :body, null: false
      t.belongs_to :post, index: true

      t.timestamps
    end
  end
end
