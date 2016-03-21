require "rails_helper"

RSpec.describe Item, :type => :model do
  describe Item do
    it { should validate_presence_of(:brand)}
    it { should validate_presence_of(:category)}
    it { should validate_presence_of(:color)}
    it { should validate_presence_of(:condition)}
    it { should validate_presence_of(:description)}
    it { should validate_presence_of(:image_upload_id)}
  end
end
