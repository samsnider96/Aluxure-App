class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @items = current_user.items.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.create(item_params)
    if @item.save
      redirect_to new_product_image_path(item_id: @item.id)
    else
      render :new, :status => :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:user_id, :brand, :type, :color, :size, :material, :condition, :description, :photo)
  end
end
