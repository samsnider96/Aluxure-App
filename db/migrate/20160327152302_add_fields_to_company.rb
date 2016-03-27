class AddFieldsToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :website, :string
    add_column :companies, :number_of_locations, :string
    add_column :companies, :annual_revenue, :string
  end
end
