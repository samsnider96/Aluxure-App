class CreateAppointmentRequests < ActiveRecord::Migration
  def change
    create_table :appointment_requests do |t|
      t.integer :company_id
      t.integer :user_id
      t.integer :comment_id
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :approved
      t.timestamps null: false
    end
  end
end
