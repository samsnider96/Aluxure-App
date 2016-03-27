class RenameWebsiteToUrl < ActiveRecord::Migration
  def change
    rename_column :companies, :website, :url
  end
end
