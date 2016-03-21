class ImageUploadsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @image_upload = ImageUpload.find(params[:id])
    @image_upload.destroy
    redirect_to dashboard_path
  end
end
