require 'rails_helper'

RSpec.describe AppointmentRequestsController, type: :controller do
  describe "GET #index" do
    it "should result in 200 OK" do
      sign_in FactoryGirl.create(:user)
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    it "should result in 200 OK" do
      company = FactoryGirl.create(:company)
      sign_in FactoryGirl.create(:user)
      appointment_request = FactoryGirl.create(:appointment_request)
      get :show, id: appointment_request.id, company_id: company.id
      response.should render_template :show
    end
  end 

  describe "GET #new" do
    it "should result in 200 OK" do
      company = FactoryGirl.create(:company)
      item = FactoryGirl.create(:item)
      sign_in FactoryGirl.create(:user)
      get :new, company_id: company.id, item_ids: ["1"]
      response.should render_template :new
    end
  end
end
