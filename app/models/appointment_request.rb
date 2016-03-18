class AppointmentRequest < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
  has_many :comments
  has_many :appointment_items
  has_many :items, through: :appointment_items

  validates :company_id, :user_id, :start_time, :end_time, presence: true
  validate :start_must_be_before_end_time

  private

  def start_must_be_before_end_time
      errors.add(:start_time, "must be before end time") unless start_time < end_time
  end 
end
