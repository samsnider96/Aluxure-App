module AppointmentRequestsHelper
  def item_status(item)
    if item.status == AppointmentItem::STATUS[0]
      '<i class="fa fa-clock-o"></i> '.html_safe + AppointmentItem::STATUS[0]
    elsif item.status == AppointmentItem::STATUS[1]
      '<i class="fa fa-check" style="color:#29AFE7"></i> '.html_safe + AppointmentItem::STATUS[1]
    elsif item.status == AppointmentItem::STATUS[2]
      '<i class="fa fa-minus-circle" style="color:red"></i> '.html_safe + AppointmentItem::STATUS[2]
    elsif item.status == AppointmentItem::STATUS[3]
      '<i class="fa fa-list" style="color:#34495E"></i> '.html_safe + AppointmentItem::STATUS[3]
    elsif item.status == AppointmentItem::STATUS[4]
      '<i class="fa fa-usd" style="color:#5CB85C"></i> '.html_safe + AppointmentItem::STATUS[4]
    end


  end

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
