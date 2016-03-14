class AppointmentItem < ActiveRecord::Base

  belongs_to :appointment_requests
  belongs_to :items

  validates :appointment_request_id, :item_id, presence: true
end
