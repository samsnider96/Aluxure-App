module AppointmentItemsHelper
  def checked(appointment_item, status)
    return 'checked="checked"' if appointment_item.status == status
  end
end