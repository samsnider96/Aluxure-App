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
  render_views

  describe "GET #show" do
    it "should result in 200 OK" do
      sign_in FactoryGirl.create(:user)
      item = FactoryGirl.create(:item)
      FactoryGirl.create(:image_upload)
      get :show, id: item.id
      expect(response).to render_template :show
    end
  end 

  describe "GET #new" do
    it "should result in 200 OK" do
      sign_in FactoryGirl.create(:user)
      company = FactoryGirl.create(:item)
      image_upload = FactoryGirl.create(:image_upload)
      get :new, image_upload_id: image_upload.id
      expect(response).to render_template :new
    end

    it "should redirect to add photos page if image_upload_id is nil" do
      sign_in FactoryGirl.create(:user)
      get :new
      expect(response).to redirect_to(new_product_image_path)
    end
  end

  describe "POST #create" do
    it "should redirect to new item page if invalid entry" do
      post :create, {user_id: 1, brand: ""}
      expect(response.status).to eq(302)
    end

    it "should increase item count if new item is created" do
      user = FactoryGirl.create(:user)
      image_upload = user.image_uploads.create(id: 1)
      product_image = FactoryGirl.create(:product_image, image_upload_id: image_upload.id, item_id: nil)
      product_image_2 = FactoryGirl.create(:product_image, id: 201, image_upload_id: image_upload.id, item_id: nil)
      sign_in user
      expect(product_image.item_id).to be_nil
      expect{
        post :create, { item: FactoryGirl.attributes_for(:item), image_upload_id: image_upload.id }
      }.to change(Item, :count).by(1)
      expect(product_image.reload.item_id).to_not be_nil
      expect(product_image_2.reload.item_id).to_not be_nil
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
