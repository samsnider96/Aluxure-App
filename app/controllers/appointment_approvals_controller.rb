class AppointmentApprovalsController < AppointmentStatusesController

  def create
    @appointment_request = AppointmentRequest.find(params[:appointment_request_id])
    @appointment_request.update(approved: true)
    flash[:success] = "Appointment approved"
    redirect_to appointment_requests_path
  end

end
