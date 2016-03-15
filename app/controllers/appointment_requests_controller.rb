class AppointmentRequestsController < ApplicationController
  def index
    @appointment_requests = current_user.appointment_requests.all
  end

  def new
    @company = Company.find(params[:company_id])
    @items = []
    params[:item_ids].split(",").each{|item_id| @items.push(Item.find(item_id)) } # push all item objects into array
  end

  def create
    @appointment_request = current_user.appointment_requests.create(appointment_request_params)
    params[:items].each{ |item| @appointment_request.appointment_items.create(item_id: item.id) } # create appointment item objects for each item
  end

  private

  def appointment_request_params
    params.require(:appointment_request).permit(:company_id, :user_id, :start_time, :end_time)
  end
end
