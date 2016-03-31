class StaticPagesController < ApplicationController
  def index
    return redirect_to dashboard_path if current_user.present?
    render layout: "landing_page"
  end  

end
