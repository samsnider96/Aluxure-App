class AddSuitColumnsToItem < ActiveRecord::Migration
  def change
    add_column :items, :jacket_sizes, :string
    add_column :items, :pants_sizes, :string
  end
end
