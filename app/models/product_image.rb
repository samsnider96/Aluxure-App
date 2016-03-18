class ProductImage < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  belongs_to :product
  belongs_to :image_upload
end
