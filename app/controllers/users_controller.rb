class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @items = Item.where(user_id: params[:id]).order(updated_at: :desc).page(params[:page]).per(5)
  end
end
