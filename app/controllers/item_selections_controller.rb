class ItemSelectionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @items = current_user.items.order(updated_at: :desc)
  end

  def create
    respond_to do |format|
      format.html   { redirect_to root_path  }
      format.js { render text: "" }
    end
  end

end
