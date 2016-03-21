class AddIndices < ActiveRecord::Migration
  def change
    add_index :appointment_items, :item_id
    add_index :appointment_items, :appointment_request_id
    add_index :appointment_requests, :company_id
    add_index :appointment_requests, :user_id
    add_index :appointment_requests, :updated_at
    add_index :comments, :appointment_request_id
    add_index :comments, :user_id
    add_index :comments, :updated_at
    add_index :items, :user_id
    add_index :product_images, :item_id
    add_index :users, :company_id
    add_index :users, :photo
    add_index :companies, :name
  end
end
