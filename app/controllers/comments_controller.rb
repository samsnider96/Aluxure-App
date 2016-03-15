class CommentsController < ApplicationController
  before_action :authenticate_user!
  def new

  end

  def create
    @comment = AppointmentRequest.find(params[:appointment_request_id]).comments.create(comment_params)
    return redirect_to appointment_request_path(params[:appointment_request_id]) if @comment.save
    redirect_to appointment_request_path(params[:appointment_request_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :appointment_request_id, :user_id)
  end
end
