class ProductImagesController < ApplicationController
  before_action :authenticate_user!

  def new
    @product_image = ProductImage.new(item_id_params)
    @images ||= ProductImage.where(item_id: params[:item_id])
  end

  def create
    @product_image = ProductImage.create(product_image_params)
    if @product_image.save
      flash[:success] = "Photo Added"
      redirect_to new_product_image_path(item_id: params[:product_image][:item_id])
    else
      flash[:danger] = "Invalid Photo"
      render :new
    end
  end

  private

  def product_image_params
    params.require(:product_image).permit(:item_id, :photo)
  end

  def item_id_params
    params.permit(:item_id)
  end
end
