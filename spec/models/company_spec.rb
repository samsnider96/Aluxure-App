require "rails_helper"

RSpec.describe Company, :type => :model do
  it { should validate_presence_of :name}
  it { should validate_presence_of :description}
  it { should validate_presence_of :city}
  it { should validate_presence_of :country}
  it { should validate_presence_of :phone}
  it { should validate_presence_of :email}
  it { should validate_presence_of :annual_revenue}
  it { should validate_presence_of :number_of_locations}

  describe "website field" do
    it "should validate the website URL" do
      expect(FactoryGirl.build(:company, url: "asdlkaks")).to_not be_valid
    end
  end

  it "should accept company with all required fields" do
    company = FactoryGirl.create(:company)
    expect(Company.count).to eq(1)
  end
end