class Company < ActiveRecord::Base
  has_many :appointment_requests

  validates :phone, format: { with: /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/, message: "Please enter phone number with xxx-xxx-xxxx" }
  validates :name, :description, :city, :country, :phone, :email, presence: true

end
