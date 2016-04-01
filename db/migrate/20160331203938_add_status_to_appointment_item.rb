class AddStatusToAppointmentItem < ActiveRecord::Migration
  def change
    add_column :appointment_items, :status, :string, default: "Pending"
  end
end
