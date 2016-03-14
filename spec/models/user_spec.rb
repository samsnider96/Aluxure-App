require "rails_helper"

RSpec.describe User, :type => :model do
  it "shouldn't accept users without all required fields" do
    user = User.create(email: "example@example.com", password: "password", password_confirmation: "password")
    user.valid?
    expect(user.errors).to have_key(:first_name)
    expect(user.errors).to have_key(:last_name)
    expect(user.errors).to have_key(:phone)
  end

  it "should accept users with all required fields" do
    user = User.create!(email: "example@example.com", password: "password", password_confirmation: "password", phone: "201-652-1441", first_name: "John", last_name: "Doe")

    expect(User.count).to eq(1)
  end

  it "should not accept invalid phone numbers" do
    user = FactoryGirl.build(:user, phone: "2abs32r")
    expect(user.valid?).to eq false
  end
end