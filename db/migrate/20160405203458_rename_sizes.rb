class RenameSizes < ActiveRecord::Migration
  def change
    rename_column :items, :jacket_sizes, :jacket_size
    rename_column :items, :pants_sizes, :pants_size
  end
end
