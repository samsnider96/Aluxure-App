class ItemSelectionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @items = current_user.items.all
  end

  def create
    respond_to do |format|
      format.html   { redirect_to root_path  }
      format.js { render text: "" }
    end
  end

end
