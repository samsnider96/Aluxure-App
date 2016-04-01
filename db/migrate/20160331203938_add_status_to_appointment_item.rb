class AddStatusToAppointmentItem < ActiveRecord::Migration
  def change
    add_column :appointment_items, :status, :string, default: AppointmentItem::STATUS[:pending]
  end
end
