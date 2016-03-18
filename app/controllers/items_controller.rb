class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_owner?, only: [:edit, :update, :destroy]

  def index
    @items = current_user.items.order(updated_at: :desc)
  end

  def show
    @item = Item.find(params[:id])
    @images = ImageUpload.find(@item.image_upload_id).product_images
  end

  def new
    @item = Item.new
    @images ||= ProductImage.where(image_upload_id: params[:image_upload_id])
  end

  def create
    @item = current_user.items.create(item_params)
    if @item.save
      ImageUpload.find(@item.image_upload_id).product_images.update_all(item_id: @item.id)
      redirect_to items_path
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
    params.require(:item).permit(:user_id, :brand, :type, :color, :size, :material, :condition, :description, :category, :image_upload_id)
  end
end
