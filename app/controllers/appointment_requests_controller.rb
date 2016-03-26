class AppointmentRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_invalid_date, only: :create

  def index
    @appointment_requests = current_user.appointment_requests.order(updated_at: :desc)
    @incoming_requests = AppointmentRequest.where(company_id: current_user.company_id)
  end

  def show
    @appointment_request = AppointmentRequest.find(params[:id])
    @company = Company.find(@appointment_request.company_id)
    @appointment_items = @appointment_request.appointment_items
    @comments = @appointment_request.comments.order(updated_at: :desc)
  end

  def new
    @company = Company.find(params[:company_id])
    @items = []
    params[:item_ids].split(",").each{|item_id| @items.push(Item.find(item_id)) } # push all item objects into array
  end

  def create
    params[:appointment_request][:end_time] = (DateTime.parse(params[:appointment_request][:start_time]) + 30.minutes).strftime('%Y-%m-%d %k:%M')
    binding.pry
    @appointment_request = AppointmentRequest.create(appointment_request_params)
    if @appointment_request.save
      params[:items].each{ |item| @appointment_request.appointment_items.create(item_id: item) } # create appointment item objects for each item
      redirect_to appointment_requests_path
    else
      flash[:danger] = @appointment_request.errors.full_messages[0]
      redirect_to :back
    end
  end

  private

  def check_invalid_date
    begin
      DateTime.parse(params[:appointment_request][:start_time])
    rescue
      flash[:danger] = "Invalid date"
      redirect_to :back
    end
  end

  def appointment_request_params
    params.require(:appointment_request).permit(:company_id, :user_id, :start_time, :end_time, :approved, :declined, :sched_date_field, :sched_time_field)
  end
end
