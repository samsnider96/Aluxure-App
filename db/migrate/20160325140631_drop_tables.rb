class DropTables < ActiveRecord::Migration
  def change
    drop_table :genders
    drop_table :mens_items
    drop_table :womens_items
    drop_table :read_marks
  end
end
