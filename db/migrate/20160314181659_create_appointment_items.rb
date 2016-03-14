class CreateAppointmentItems < ActiveRecord::Migration
  def change
    create_table :appointment_items do |t|
      t.integer :appointment_request_id
      t.integer :item_id
      t.timestamps null: false
    end
  end
end
