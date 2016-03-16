class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_owner?, only: [:edit, :update, :destroy]

  def index
    @items = current_user.items.order(updated_at: :desc)
  end

  def show
    @item = Item.find(params[:id])
    @images = ProductImage.where(item_id: @item.id)
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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    return redirect_to items_path if @item.save
    flash[:danger] = "Woops, looks like something went wrong. Please try again."
    render :edit
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:danger] = "Item deleted"
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:user_id, :brand, :type, :color, :size, :material, :condition, :description)
  end
end
