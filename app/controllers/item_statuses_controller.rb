class ItemStatusesController < AppointmentStatusesController
  respond_to :js, :html, :json

  def update
    @item = AppointmentItem.find(params[:id])
    @item.update(item_statuses_params)
    respond_to do |format|
      format.html { render nothing: true}
      format.js { render nothing: true}
    end
  end

  private

  def item_statuses_params
    params.require(:appointment_item).permit(:appointment_request_id, :item_id, :status)
  end
end