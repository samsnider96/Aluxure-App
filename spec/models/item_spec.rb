require "rails_helper"

RSpec.describe Item, :type => :model do
  describe Item do
    it { should validate_presence_of(:brand)}
    it { should validate_presence_of(:category)}
    it { should validate_presence_of(:color)}
    it { should validate_presence_of(:condition)}
    it { should validate_presence_of(:description)}
    it { should validate_presence_of(:image_upload_id)}
    it { should validate_presence_of(:gender)}
    it { should validate_presence_of(:material)}
  end

  context "Item is a suit" do
    it "should not give an error if size is empty when category is Suits" do 
      expect{
        FactoryGirl.create(:item, category: "Suits", size: "")
        }.to change(Item, :count).by(1)
    end
  end

  context "Item is not a suit" do
    item = FactoryGirl.create(:item, category: "Shirt", size: 2)
    it { should validate_presence_of :size }
  end
  
end
