class Item < ActiveRecord::Base

  belongs_to :user
  has_many :product_images, dependent: :destroy
  has_many :appointment_items
  has_many :appointment_reqeusts, through: :appointment_items
end
