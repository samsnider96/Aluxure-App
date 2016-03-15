class ChangeProductIdToItemId < ActiveRecord::Migration
  def change
    rename_column :product_images, :product_id, :item_id
  end
end
