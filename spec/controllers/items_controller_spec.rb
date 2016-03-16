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
  describe "GET #show" do
    it "should result in 200 OK" do
      sign_in FactoryGirl.create(:user)
      item = FactoryGirl.create(:item)
      get :show, id: item.id
      response.should render_template :show
    end
  end 

  describe "GET #new" do
    it "should result in 200 OK" do
      sign_in FactoryGirl.create(:user)
      company = FactoryGirl.create(:item)
      get :new
      response.should render_template :new
    end
  end

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

  describe "DELETE #destroy" do

    it "should let user who owns the item delete the item" do
      user = FactoryGirl.create(:user)
      item = FactoryGirl.create(:item)
      sign_in user
      expect{
        delete :destroy, id: item.id
      }.to change(Item, :count).by(-1)
    end

    it "shouldn't let user who doesn't own the item delete the item" do
      user = FactoryGirl.create(:user, id: 2)
      item = FactoryGirl.create(:item)
      sign_in user
      expect{
        delete :destroy, id: item.id
      }.to_not change(Item, :count)
    end

    it "should delete the item photos after the item has been deleted" do
      user = FactoryGirl.create(:user)
      item = FactoryGirl.create(:item)
      product_image = FactoryGirl.create(:product_image)
      sign_in user
      expect{
        delete :destroy, id: item.id
      }.to change(ProductImage, :count).by(-1)
    end

  end

end
