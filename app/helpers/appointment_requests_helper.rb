module AppointmentRequestsHelper
  def status(incoming_request)
    if incoming_request.approved 
      "Approved" 
    elsif incoming_request.declined 
      "Declined" 
    else 
      "Waiting" 
    end
  end

  def status_icon(incoming_request)
    if incoming_request.approved 
      '<i class="fa fa-check-circle" style="color:#05CE05;"></i>'.html_safe
    elsif incoming_request.declined 
      '<i class="fa fa-times-circle" style="color:#D9534F"></i>'.html_safe
    else 
      '<i class="fa fa-hourglass-half"></i>'.html_safe
    end

  end
end
