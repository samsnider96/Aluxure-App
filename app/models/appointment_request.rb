class AppointmentRequest < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
  has_many :comments
  has_many :appointment_items
  has_many :items, through: :appointment_items

  validates :company_id, :user_id, :start_time, :end_time, presence: true
  validate :start_must_be_before_end_time

  before_save :convert_to_datetime

  def sched_date_field
    sched_time.strftime("%d/%m/%Y") if start_time.present?
  end 

  def sched_time_field
    sched_time.strftime("%I:%M%p") if start_time.present?
  end

  def sched_date_field=(date)
    # Change back to datetime friendly format
    @sched_date_field = Date.parse(date).strftime("%Y-%m-%d")
  end

  def sched_time_field=(time)
    # Change back to datetime friendly format
    @sched_time_field = Time.parse(time).strftime("%H:%M:%S")
  end

  def convert_to_datetime
    self.start_time = DateTime.parse("#{@sched_date_field} #{@sched_time_field}")
  end

  private

  def start_must_be_before_end_time
      errors.add(:start_time, "must be before end time") unless start_time < end_time
  end 
end
