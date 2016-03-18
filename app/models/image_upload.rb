class ImageUpload < ActiveRecord::Base
  has_many :product_images
  belongs_to :user
  has_one :item
end
