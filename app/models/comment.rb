class Comment < ActiveRecord::Base

  belongs_to :appointment_request
end
