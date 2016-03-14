class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :photo
      t.string :name
      t.text :description
      t.string :line_1
      t.string :line_2
      t.string :line_3
      t.string :city
      t.string :county_province
      t.string :zip_or_postcode
      t.string :country
      t.string :other_address_details
      t.string :phone
      t.string :email
      t.timestamps null: false
    end
  end
end
