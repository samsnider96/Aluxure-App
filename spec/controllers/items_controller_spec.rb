require 'rails_helper'

def valid_attributes
  {
    user_id: 1,
    brand: "brand",
    category: "Shirt",
    color: "Color",
    size: "Size",
    material: "Material",
    condition: "normal",
    description: "blah"
  }
end

RSpec.describe ItemsController, type: :controller do

  it "should redirect to new item page if invalid entry" do
    post :create, {user_id: 1, brand: ""}
    expect(response.status).to eq(302)
  end

  it "should increase item count if new item is created" do
    sign_in FactoryGirl.create(:user)
    post :create, { item: valid_attributes }
    expect(Item.count).to eq(1)
  end

  # it "should pass correct param when new item is created" do
  #   sign_in FactoryGirl.create(:user)
  #   post :create, { item: valid_attributes }
  #   controller.params[:item_id].should_not be_nil
  # end
end
