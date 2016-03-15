require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe "POST #create" do
    it "shouldn't let user not signed in to post" do
      appointment_request = FactoryGirl.create(:appointment_request, id: 1)
      post :create, appointment_request_id: appointment_request.id, comment: FactoryGirl.attributes_for(:comment) 
      expect(appointment_request.comments.count).to eq(0)
    end

    it "should increase post count by 1 on valid comment" do
      user = FactoryGirl.create(:user)
      sign_in user
      appointment_request = FactoryGirl.create(:appointment_request, id: 1)
      post :create, appointment_request_id: appointment_request.id, comment: FactoryGirl.attributes_for(:comment) 
      expect(appointment_request.comments.count).to eq(1)
    end

    it "shouldn't increase post count on invalid comment" do
      user = FactoryGirl.create(:user)
      sign_in user
      appointment_request = FactoryGirl.create(:appointment_request, id: 1)
      post :create, appointment_request_id: appointment_request.id, comment: FactoryGirl.attributes_for(:comment, text: "") 
      expect(appointment_request.comments.count).to eq(0)
    end
  end
end
