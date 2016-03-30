require "rails_helper"

RSpec.describe User, :type => :model do

  it { should validate_presence_of :first_name}
  it { should validate_presence_of :last_name}
  it { should validate_presence_of :phone}

  it "should accept users with all required fields" do
    user = User.create!(email: "example@example.com", password: "password", password_confirmation: "password", phone: "201-652-1441", first_name: "John", last_name: "Doe", confirmed_at: Time.now)
    expect(User.count).to eq(1)
  end

  it "should not accept invalid phone numbers" do
    expect(FactoryGirl.build(:user, phone: "2abs32r")).to_not be_valid
  end

  describe "is_company_account? method" do

    it "should return true if it is company account" do
      user = FactoryGirl.create(:user, type: "CompanyUser")
      expect(user.is_company_account?).to be(true)
    end

    it "should return false if its not a company account" do
      user = FactoryGirl.create(:user)
      expect(user.is_company_account?).to be(false)
    end
  end


end