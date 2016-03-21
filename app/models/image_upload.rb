class ImageUpload < ActiveRecord::Base
  has_many :product_images, dependent: :destroy
  belongs_to :user
  has_one :item
end
