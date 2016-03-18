module ApplicationHelper
  def fullname(user)
    "#{user.first_name} #{user.last_name}"
  end

  def display_datetime(datetime)
    datetime.strftime("%m/%d/%Y %l:%M %p")
  end
end
