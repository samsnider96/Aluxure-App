class FixDeclinedColumn < ActiveRecord::Migration
  def change
    remove_column :users, :declined
    add_column :appointment_requests, :declined, :boolean, default: false
  end
end
