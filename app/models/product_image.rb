class ProductImage < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  belongs_to :product
end
