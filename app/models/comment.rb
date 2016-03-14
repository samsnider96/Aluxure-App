class Comment < ActiveRecord::Base

  belongs_to :appointment_request

  validates :text, :appointment_request_id, presence: true
end
