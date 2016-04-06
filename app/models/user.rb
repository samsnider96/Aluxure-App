class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  mount_uploader :photo, PhotoUploader

  has_many :items, dependent: :destroy
  has_many :appointment_requests, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :image_uploads, dependent: :destroy
  has_many :read_statuses, dependent: :destroy

  belongs_to :company

  validates :first_name, :last_name, :phone, presence: true
  validates :phone, format: { with: /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/, message: "Please enter phone number with xxx-xxx-xxxx" }

  validates :terms_and_conditions, acceptance: true

  def is_company_account?
    return false unless self.type == "CompanyUser"
    true
  end
  
end
