class AppointmentApprovalsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_owner?

  def create
    @appointment_request = AppointmentRequest.find(params[:appointment_request_id])
    @appointment_request.update(approved: true)
    flash[:success] = "Appointment approved"
    redirect_to appointment_requests_path
  end

  private

  def is_owner?
    return if AppointmentRequest.find(params[:appointment_request_id]).company_id == current_user.company_id
    flash[:danger] = "Unauthorized"
    redirect_to root_path
  end
end
