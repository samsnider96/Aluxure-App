class AddImageUploadIdToProductImage < ActiveRecord::Migration
  def change
    add_column :product_images, :image_upload_id, :integer
    add_index :product_images, :image_upload_id
  end
end
