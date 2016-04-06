module ApplicationHelper

  def fullname(user)
    "#{user.first_name} #{user.last_name}"
  end

  def display_datetime(datetime)
    datetime.strftime("%m/%d/%Y %l:%M %p")
  end

  def display_date(datetime)
    datetime.strftime("%m/%d/%Y")
  end
end

class String
  def to_empty
    "hi"
  end
end
