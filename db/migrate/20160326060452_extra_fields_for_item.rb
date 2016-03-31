class ExtraFieldsForItem < ActiveRecord::Migration
  def change
    add_column :items, :sleeve_length, :string
    add_column :items, :inseam_length, :string
    add_column :items, :suit_length, :string
    add_column :items, :shoe_width, :string
  end
end
