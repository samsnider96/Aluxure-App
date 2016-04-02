class AppointmentRequest < ActiveRecord::Base
  belongs_to :company, counter_cache: true
  belongs_to :user, counter_cache: true

  has_many :comments, dependent: :destroy
  has_many :appointment_items, dependent: :destroy
  has_many :items, through: :appointment_items
  has_many :read_statuses, dependent: :destroy

  validates :company_id, :user_id, :start_time, :end_time, presence: true
  validate :start_must_be_before_end_time

  private

  def start_must_be_before_end_time
      errors.add(:start_time, "must be before end time") unless start_time < end_time
  end 
end
