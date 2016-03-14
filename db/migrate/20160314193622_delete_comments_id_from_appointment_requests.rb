class DeleteCommentsIdFromAppointmentRequests < ActiveRecord::Migration
  def change
    remove_column :appointment_requests, :comment_id
  end
end
