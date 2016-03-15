class ItemSelectionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @items = current_user.items.all
  end

  def create

  end

end
