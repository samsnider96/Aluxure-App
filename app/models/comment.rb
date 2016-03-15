class Comment < ActiveRecord::Base

  belongs_to :appointment_request
  belongs_to :user

  validates :text, :appointment_request_id, :user_id, presence: true
end
