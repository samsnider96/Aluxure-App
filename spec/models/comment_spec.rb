require "rails_helper"

RSpec.describe Comment, :type => :model do
  it "shouldn't accept comment without text and appointment_request_id" do
    comment = FactoryGirl.build(:comment, text: "")
    expect(comment.valid?).to be false
  end

  it "should accept comment with all required fields" do
    comment = FactoryGirl.create(:comment)
    expect(Comment.count).to eq(1)
  end
end