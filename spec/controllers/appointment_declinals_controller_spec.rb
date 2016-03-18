require 'rails_helper'

RSpec.describe AppointmentDeclinalsController, type: :controller do
  describe "POST #create" do
    it "should set appointment request declined column to false" do
      user = FactoryGirl.create(:user, company_id: 1)
      sign_in user
      appointment_request = FactoryGirl.create(:appointment_request)
      post :create, appointment_request_id: appointment_request.id
      expect(appointment_request.reload.declined).to eq(true)
    end

    it "shouldn't let user who isn't part of the company to reject the request" do
      user = FactoryGirl.create(:user, company_id: 222)
      sign_in user
      appointment_request = FactoryGirl.create(:appointment_request)
      post :create, appointment_request_id: appointment_request.id
      expect(appointment_request.reload.declined).to eq(false)
    end
  end
end
