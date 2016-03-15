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
end
