namespace :appointment_item do
  desc "TODO"
  task cleanup: :environment do
    AppointmentItem.where(item_id: nil).destroy_all
    AppointmentItem.where(appointment_request_id: nil).destroy_all
  end

end
