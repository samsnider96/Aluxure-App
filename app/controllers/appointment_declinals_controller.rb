class AppointmentDeclinalsController < AppointmentStatusesController

  def create
    @appointment_request = AppointmentRequest.find(params[:appointment_request_id])
    @appointment_request.update(declined: true)
    flash[:success] = "Appointment declined"
    redirect_to appointment_requests_path
  end
end
