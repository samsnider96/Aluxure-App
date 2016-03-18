class AddImageUploadIdToItem < ActiveRecord::Migration
  def change
    add_column :items, :image_upload_id, :integer
    add_index :items, :image_upload_id
  end
end
