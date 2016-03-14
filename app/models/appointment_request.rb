class AppointmentRequest < ActiveRecord::Base

  belongs_to :company
  belongs_to :user
  has_many :comments
  has_many :appointment_items
  has_many :items, through: :appointment_items
end
