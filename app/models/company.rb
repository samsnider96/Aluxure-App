require 'uri'

class Company < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  has_many :appointment_requests
  has_many :users

  validates :phone, format: { with: /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/, message: "Please enter phone number with xxx-xxx-xxxx" }
  validates :name, :description, :city, :country, :phone, :email, :number_of_locations, :annual_revenue, presence: true

  validates :url, format: { with: URI::regexp(%w(http https)), message: "Please enter a valid URL." }, allow_blank: true

  ANNUAL_REVENUE_OPTIONS = ["Less than $250,000", "$250,000 to $500,000", "$500,000 to $1 million", "Greater than $1 million"]
  LOCATION_NUMBER_OPTIONS = ["1", "2", "3 ~ 5", "Greater than 5"]

end
