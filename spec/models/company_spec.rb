require "rails_helper"

RSpec.describe Company, :type => :model do
  it "shouldn't accept company without all required fields" do
    company = FactoryGirl.build(:company, email: "").should_not be_valid
  end

  it "should accept company with all required fields" do
    company = FactoryGirl.create(:company)
    expect(Company.count).to eq(1)
  end
end