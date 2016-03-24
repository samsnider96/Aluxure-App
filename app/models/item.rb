class Item < ActiveRecord::Base

  belongs_to :user
  has_many :product_images, dependent: :destroy
  has_many :appointment_items
  has_many :appointment_reqeusts, through: :appointment_items
  has_many :item_attributes

  validates_presence_of :brand_id, :category_id, :color, :condition, :description, :image_upload_id

  CONDITION = ["New", "Like New", "Very Good", "Good", "Fair"]
  COLORS = ["Brown", "Black", "Red", "Pink", "Blue", "White", "Green", "Beige", "Orange", "Yellow", "Purple", "Grey", "Multicolor", "Metallic", "OTHER "]


end
