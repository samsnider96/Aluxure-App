require "rails_helper"

RSpec.describe AppointmentItem, :type => :model do
  it "shouldn't accept an appointment_item without an appointment_request_id and item_id" do
    expect(FactoryGirl.build(:appointment_item, appointment_request_id: "", item_id: "")).to_not be_valid
  end

  it "should accept appointment_item with all required fields" do
    appointment = FactoryGirl.create(:appointment_item)
    expect(AppointmentItem.count).to eq(1)
  end
end