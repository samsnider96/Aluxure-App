class CreateItemAttributes < ActiveRecord::Migration
  def change
    create_table :item_attributes do |t|
      t.string :name
      t.string :gender
      t.string :category
      t.string :type
      t.timestamps null: false
    end
  end
end
