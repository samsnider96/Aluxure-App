class ChangeItemDescriptionToText < ActiveRecord::Migration
  def change
    change_column :items, :description, :text
    add_column :users, :photo, :string
  end
end
