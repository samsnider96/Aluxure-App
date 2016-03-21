require 'rails_helper'

RSpec.describe ImageUpload, type: :model do
  it "should delete product images that belong to the class when class is destroyed" do
    user = FactoryGirl.create(:user)
    image_upload = FactoryGirl.create(:image_upload, user_id: user.id)
    product_image_1 = FactoryGirl.create(:product_image, image_upload_id: image_upload.id)
    product_image_2 = FactoryGirl.create(:product_image, image_upload_id: image_upload.id)
    
    expect{image_upload.destroy}.to change(ProductImage, :count).by(-2)
  end
end
