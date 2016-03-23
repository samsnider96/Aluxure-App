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

  def edit
    @item = Item.find_by(image_upload_id: params[:image_upload_id])
    @product_image = ProductImage.new(item_id_params)
    @images ||= ProductImage.where(image_upload_id: params[:image_upload_id])
  end

  def update
    @image_upload = params[:image_upload_id] ? ImageUpload.find(params[:image_upload_id]) : current_user.image_uploads.create
    @product_image = ProductImage.create(product_image_params)
    if @product_image.save
      flash[:success] = "Photo Added"
      redirect_to edit_product_image_path(image_upload_id: @image_upload)
    else
      flash[:danger] = "Invalid Photo"
      render :edit
    end
  end

  def destroy
    @product_image = ProductImage.find(params[:id])
    @product_image.destroy
    redirect_to :back
  end 

  private

  def product_image_params
    params.require(:product_image).permit(:item_id, :photo, :image_upload_id).merge(image_upload_id: @image_upload.id)
  end

  def item_id_params
    params.permit(:item_id)
  end
end
