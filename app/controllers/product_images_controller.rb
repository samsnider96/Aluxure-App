class ProductImagesController < ApplicationController
  before_action :authenticate_user!

  def new
    @product_image = ProductImage.new(item_id_params)
    @images ||= ProductImage.where(image_upload_id: params[:image_upload_id])
  end

  def create
    @image_upload = params[:image_upload_id] ? ImageUpload.find(params[:image_upload_id]) : current_user.image_uploads.create
    @product_image = ProductImage.create(product_image_params)
    if @product_image.save
      flash[:success] = "Photo Added"
      redirect_to new_product_image_path(image_upload_id: @image_upload)
    else
      flash[:danger] = "Invalid Photo"
      render :new
    end
  end

  private

  def product_image_params
    params.require(:product_image).permit(:item_id, :photo, :image_upload_id).merge(image_upload_id: @image_upload.id)
  end

  def item_id_params
    params.permit(:item_id)
  end
end
