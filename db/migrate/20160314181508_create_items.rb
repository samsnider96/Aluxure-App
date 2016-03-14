class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :user_id
      t.string :brand
      t.string :type
      t.string :color
      t.string :size
      t.string :material
      t.string :condition
      t.string :description
      t.string :photo
      t.timestamps null: false
    end
  end
end
