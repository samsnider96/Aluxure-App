require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  describe "GET #show" do
    it "should result in 200 OK" do
      sign_in FactoryGirl.create(:user)
      company = FactoryGirl.create(:company)
      get :show, id: company.id
      expect(response).to render_template :show
    end
  end 

  describe "GET #new" do
    it "should result in 200 OK" do
      sign_in FactoryGirl.create(:user)
      company = FactoryGirl.create(:company)
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do

    it "shouldn't allow a user that is not signed in to post" do
      expect{
        post :create, FactoryGirl.attributes_for(:company)
      }.to_not change(Company, :count)
    end

    it "should create a new company on a valid submission" do
      user = FactoryGirl.create(:user, paid: true)
      sign_in user
      expect{
        post :create, company: FactoryGirl.attributes_for(:company)
      }.to change(Company, :count).by(1)
    end

    it "shouldn't create a new company on a valid submission" do
      user = FactoryGirl.create(:user, paid: true)
      sign_in user
      expect{
        post :create, company: FactoryGirl.attributes_for(:company, email: "")
      }.to_not change(Company, :count)
    end

    # it "shouldn't create create a new company if a user hasn't paid" do
    #   user = FactoryGirl.create(:user)
    #   sign_in user
    #   expect {
    #     post :create, company: FactoryGirl.attributes_for(:company)
    #   }.to_not change(Company, :count)
    # end

    # it "should redirect a user if they haven't paid" do
    #   user = FactoryGirl.create(:user)
    #   sign_in user
    #   post :create, company: FactoryGirl.attributes_for(:company)
    #   expect(response).to redirect_to(new_charge_path)
    # end
  end

  describe "PUT #update" do

    it "should let a user with the same company_id update the company info" do
      company = FactoryGirl.create(:company)
      user = FactoryGirl.create(:user, company_id: company.id)
      sign_in user
      expect{
        delete :destroy, id: company.id
      }.to change(Company, :count).by(-1)
    end

    it "shouldn't let a user without the same company_id update the company info" do
      company = FactoryGirl.create(:company)
      user = FactoryGirl.create(:user, id: 2)
      sign_in user
      expect{
        delete :destroy, id: company.id
      }.to_not change(Company, :count)
    end

  end
end
