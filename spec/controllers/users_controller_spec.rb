require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #show" do
    render_views
    it "should return 200" do
      user = FactoryGirl.create(:user)
      sign_in user
      get :show, id: user.id
      expect(response).to render_template :show
    end
  end

end
