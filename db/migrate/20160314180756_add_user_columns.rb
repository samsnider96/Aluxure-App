class AddUserColumns < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :integer
    add_column :users, :last_name, :integer
    add_column :users, :phone, :string
    add_column :users, :company_id, :integer
  end
end
