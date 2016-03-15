class ItemsController < ApplicationController
  before_action :authenticate_user!

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.create(item_params)
    if @item.save
      redirect_to dashboard_path
    else
      render :new, :status => :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:user_id, :brand, :type, :color, :size, :material, :condition, :description, :photo)
  end
end
