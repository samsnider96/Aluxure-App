class ChangeTypesToIdForItem < ActiveRecord::Migration
  def change
    remove_column :items, :brand
    add_column :items, :brand_id, :integer

    remove_column :items, :category
    add_column :items, :category_id, :integer

    remove_column :items, :size
    add_column :items, :size_id, :integer

    remove_column :items, :material
    add_column :items, :material_id, :integer
    
    add_index :items, :brand_id
    add_index :items, :category_id
    add_index :items, :size_id
    add_index :items, :material_id
  end
end
