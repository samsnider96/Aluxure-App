require 'rails_helper'
require 'devise'


RSpec.describe DashboardController, type: :controller do
  it "should not allow users not signed in to access index" do
    get :index
    expect(response).to have_http_status(302)
  end

  it "should allow users signed in to access index" do
    sign_in FactoryGirl.create(:user)
    get :index
    expect(response).to have_http_status(200)
  end
end
