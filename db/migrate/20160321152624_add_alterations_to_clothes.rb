class AddAlterationsToClothes < ActiveRecord::Migration
  def change
    add_column :items, :alterations, :text
  end
end
