class ChangeApprovedColumnToDefaultFalse < ActiveRecord::Migration
  def change
    change_column :appointment_requests, :approved, :boolean, default: false
  end
end
