require 'rails_helper'

RSpec.describe ProductImagesController, type: :controller do
  describe "GET #new" do
    it "should redirect user if not logged in" do
      get :new
      expect(response.status).to eq(302)
    end

    it "should return 200 if user is logged in" do
      sign_in FactoryGirl.create(:user)
      get :new
      expect(response.status).to eq(200)
    end
  end

  describe "POST #create" do
    it "should increase number of product image that the image_upload has" do
      user = FactoryGirl.create(:user)
      sign_in user
      image_upload = ImageUpload.create(user_id: user)
      
      expect{
        post :create, image_upload_id: image_upload, product_image: { 
          photo: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'files', 'test.jpg')) 
        }
      }.to change(image_upload.product_images, :count).by(1)
    end

    it "should create a new image upload on a new session" do
      user = FactoryGirl.create(:user)
      sign_in user
      expect{
        post :create, product_image: { 
          photo: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'files', 'test.jpg'))
        }
      }.to change(ImageUpload, :count).by(1)
    end
  end

  describe "DELETE #destroy" do
    # it "should redirect user to dashboard" do
    #   user = FactoryGirl.create(:user)
    #   sign_in user
    #   image_upload = ImageUpload.create(user_id: user)
    #   product_image = FactoryGirl.create(:product_image)
    #   post :destroy, id: product_image.id
    #   expect(response).to redirect_to(:back)
    # end

    it "should delete the product image" do
      user = FactoryGirl.create(:user)
      sign_in user
      image_upload = ImageUpload.create(user_id: user)
      product_image = FactoryGirl.create(:product_image)
      expect{post :destroy, id: product_image.id}.to change(ProductImage, :count).by(-1)
    end
  end
end
