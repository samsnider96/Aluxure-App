class DefaultPaidToFalse < ActiveRecord::Migration
  def change
    change_column :users, :paid, :boolean, default: false
  end
end
