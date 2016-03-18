class AddUserIDtoImageUpload < ActiveRecord::Migration
  def change
    add_column :image_uploads, :user_id, :integer
    add_index :image_uploads, :user_id
  end
end
