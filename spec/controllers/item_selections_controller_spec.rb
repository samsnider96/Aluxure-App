require 'rails_helper'

RSpec.describe ItemSelectionsController, type: :controller do
  render_views
  describe "GET #new" do
    it "should result in 200 OK" do
      sign_in FactoryGirl.create(:user)
      get :new
      expect(response).to render_template :new
    end
  end
end
