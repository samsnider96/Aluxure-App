class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @items = Item.where(user_id: params[:id])
  end
end
