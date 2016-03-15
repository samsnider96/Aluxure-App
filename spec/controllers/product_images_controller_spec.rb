require 'rails_helper'

RSpec.describe ProductImagesController, type: :controller do
  it "should redirect user if not logged in" do
    get :new
    expect(response.status).to eq(302)
  end

  it "should return 200 if user is logged in" do
    sign_in FactoryGirl.create(:user)
    get :new
    expect(response.status).to eq(200)
  end

  it "should display success if image is successfully added" do
    post :create, {product_image: {item_id: 1, photo: "photo"}}
    expect(response.status).to eq(302)
    expect(flash[:success]).to eq("Photo Added")
  end 

  it "should display error if image is not successfully added" do
    post :create, {product_image: { photo: "photo"}}
    expect(response.status).to eq(302)
    expect(flash[:error]).to eq("Invalid Photo")
  end 

  it "should increase product image count by 1 after successful post" do
    post :create, {product_image: {item_id: 1, photo: "photo"}}
    expect(ProductImage.count).to eq(1)
  end
end
