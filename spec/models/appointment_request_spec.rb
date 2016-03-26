require "rails_helper"

RSpec.describe AppointmentRequest, :type => :model do
  it "shouldn't accept company without all required fields" do
    expect(FactoryGirl.build(:appointment_request, company_id: "", user_id: "")).to_not be_valid
  end

  it "should accept company with all required fields" do
    appointment = FactoryGirl.create(:appointment_request)
    expect(AppointmentRequest.count).to eq(1)
  end
end

RSpec.describe "Appointment times" do 
  it "should always have a start time that is earlier than the end time" do
    expect(FactoryGirl.build(:appointment_request, start_time: DateTime.now, end_time: DateTime.yesterday)).to_not be_valid
  end

  # it "should set end time 30 minutes later than start time upon creation" do
  #   ar = FactoryGirl.create(:appointment_request, start_time: DateTime.now, end_time: nil)
  #   expect(ar.reload.end_time.to_i).to eq((DateTime.now + 30.minutes).to_i)
  # end
end