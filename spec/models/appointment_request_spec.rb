require "rails_helper"

RSpec.describe AppointmentRequest, :type => :model do
  it "shouldn't accept company without all required fields" do
    FactoryGirl.build(:appointment_request, company_id: "", user_id: "").should_not be_valid
  end

  it "should accept company with all required fields" do
    appointment = FactoryGirl.create(:appointment_request)
    expect(AppointmentRequest.count).to eq(1)
  end
end

RSpec.describe "Appointment times" do 
  it "should always have a start time that is earlier than the end time" do
    FactoryGirl.build(:appointment_request, start_time: DateTime.now, end_time: DateTime.yesterday).should_not be_valid
  end
end