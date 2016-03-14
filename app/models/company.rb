class Company < ActiveRecord::Base
  has_many :appointment_requests
end
