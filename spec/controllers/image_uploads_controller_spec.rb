require 'rails_helper'

RSpec.describe ImageUploadsController, type: :controller do
  describe "DELETE #destroy" do
    it "should redirect to dashboard" do
      user = FactoryGirl.create(:user)
      sign_in user
      image_upload = FactoryGirl.create(:image_upload)
      post :destroy, id: image_upload.id
      expect(response).to redirect_to(dashboard_path)
    end

    it "should delete image upload" do
      user = FactoryGirl.create(:user)
      sign_in user
      image_upload = FactoryGirl.create(:image_upload)
      expect{post :destroy, id: image_upload.id}.to change(ImageUpload, :count).by(-1)
    end

    it "shouldn't allow users that aren't signed in to delete" do
      image_upload = FactoryGirl.create(:image_upload)
      expect{post :destroy, id: image_upload.id}.to change(ImageUpload, :count).by(0)
    end
  end
end
