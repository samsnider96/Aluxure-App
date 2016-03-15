require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe "index" do
    it "renders the :index template" do
      expect(get: root_url(subdomain: nil)).to route_to(
        controller: "static_pages",
        action: "index")
    end

    it "should redirect to dashboard if user is signed in" do
      sign_in FactoryGirl.create(:user)
      get :index
      expect(response).to have_http_status(302)
    end

    it "shouldn't redirect to dashboard if user isn't signed in" do
      get :index
      expect(response).to have_http_status(200)
    end
  end


end
