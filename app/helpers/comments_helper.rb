module CommentsHelper
  def unread(appointment_request)
    read_status ||= ReadStatus.find_by(user_id: current_user.id, appointment_request_id: appointment_request.id)
    read_on = read_status ? read_status.read_on : appointment_request.created_at
    comments = appointment_request.comments.order(updated_at: :desc)
    return "<span class='badge'>0</span>".html_safe if comments.empty?
    return read_on  < comments.first.created_at ? "<span class='badge' style='background-color:red'>#{comments.where('created_at > ?', read_on).count}</span>".html_safe : "<span class='badge'>0</span>".html_safe
  end
end
