require 'rails_helper'

RSpec.describe AppointmentApprovalsController, type: :controller do
  describe "POST #create" do
    it "should update the appointment request approved to true" do
      user = FactoryGirl.create(:user, company_id: 1)
      sign_in user
      appointment_request = FactoryGirl.create(:appointment_request, company_id: 1)
      post :create, appointment_request_id: appointment_request.id
      expect(appointment_request.reload.approved).to eq(true)
    end

    it "shouldn't let user who isn't part of the company to approve the request" do
      user = FactoryGirl.create(:user, company_id: 222)
      sign_in user
      appointment_request = FactoryGirl.create(:appointment_request)
      post :create, appointment_request_id: appointment_request.id
      expect(appointment_request.reload.approved).to eq(false)
    end
  end
end
