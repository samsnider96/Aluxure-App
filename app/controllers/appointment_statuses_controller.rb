class AppointmentStatusesController < ApplicationController
  before_action :authenticate_user!
  before_action :is_owner?

  protected

  def is_owner?
    return if AppointmentRequest.find(params[:appointment_request_id]).company_id == current_user.company_id
    flash[:danger] = "Unauthorized"
    redirect_to root_path
  end
end
