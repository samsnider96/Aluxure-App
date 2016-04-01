class ReadStatus < ActiveRecord::Base

  belongs_to :user
  belongs_to :appointment_request
  
end
