class AppointmentItem < ActiveRecord::Base

  belongs_to :appointment_requests
  belongs_to :items
end
