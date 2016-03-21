require "rails_helper"

RSpec.describe Comment, :type => :model do
  it "shouldn't accept comment without text and appointment_request_id" do
    expect(FactoryGirl.build(:comment, text: "")).to_not be_valid
  end

  it "should accept comment with all required fields" do
    comment = FactoryGirl.create(:comment)
    expect(Comment.count).to eq(1)
  end
end