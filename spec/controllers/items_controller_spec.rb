require 'rails_helper'

def valid_attributes
  {
    user_id: 1,
    brand: "YOLO",
    category: "Shirt",
    color: "Color",
    size: "Size",
    material: "Material",
    condition: "normal",
    description: "blah"
  }
end

RSpec.describe ItemsController, type: :controller do
  describe "POST #create" do
    it "should redirect to new item page if invalid entry" do
      post :create, {user_id: 1, brand: ""}
      expect(response.status).to eq(302)
    end

    it "should increase item count if new item is created" do
      sign_in FactoryGirl.create(:user)
      post :create, { item: FactoryGirl.attributes_for(:item) }
      expect(Item.count).to eq(1)
    end
  end

  describe "PUT #update" do
    it "should not let users that don't own the item update the item" do
      user = FactoryGirl.create(:user, id: 2)
      item = FactoryGirl.create(:item)
      sign_in user
      put :update, { id: item.id, item: FactoryGirl.attributes_for(:item, brand: "YOLO") }
      item.reload
      expect(item.brand).to eq("brand")
    end

    it "should let users that own the item update the item" do
      user = FactoryGirl.create(:user)
      item = FactoryGirl.create(:item)
      sign_in user
      put :update, { id: item.id, item: FactoryGirl.attributes_for(:item, brand: "YOLO") }
      item.reload
      expect(item.brand).to eq("YOLO")
    end
  end

end
