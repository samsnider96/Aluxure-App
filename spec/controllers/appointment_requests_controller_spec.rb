require 'rails_helper'

RSpec.describe AppointmentRequestsController, type: :controller do
  render_views
  describe "GET #index" do
    it "should result in 200 OK" do
      sign_in FactoryGirl.create(:user)
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    before :each do
      @company = FactoryGirl.create(:company)
      @user = FactoryGirl.create(:user)
      sign_in @user
      @appointment_request = FactoryGirl.create(:appointment_request, company_id: @company.id, user_id: @user.id)
    end

    it "should result in 200 OK" do
      get :show, id: @appointment_request.id, company_id: @company.id
      expect(response).to render_template :show
    end

    it "should create a new read status object if user doesn't have one for the appointment request" do
      expect{
        get :show, id: @appointment_request.id, company_id: @company.id
      }.to change(ReadStatus, :count).by(1)
    end

    it "should update the new read status object on page visit" do
      read_status = ReadStatus.create(user_id: @user.id, appointment_request_id: @appointment_request.id)
      get :show, id: @appointment_request.id, company_id: @company.id
      expect(read_status.reload.read_on.to_i).to eq(DateTime.now.to_i)
    end
  end 

  describe "GET #new" do
    it "should result in 200 OK" do
      company = FactoryGirl.create(:company)
      item = FactoryGirl.create(:item)
      product_image = FactoryGirl.create(:product_image, item_id: item.id)
      sign_in FactoryGirl.create(:user)
      get :new, company_id: company.id, item_ids: item.id.to_s
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    it "should set end time 30 minutes after the start time" do
      # post :create, { appointment_request: { company_id: 1, user_id: 1, start_time: DateTime.now } }
      # expect(AppointmentRequest.count).to eq(1)
      # expect(@ar.end_time.to_i).to eq(@ar.start_time + 30.minutes.to_i)
    end
  end
end
