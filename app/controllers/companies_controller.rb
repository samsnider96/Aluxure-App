class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :is_owner?, only: [:edit, :update, :destroy]

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.create(company_params)
    if @company.save
      flash[:success] = "New company created"
      redirect_to company_path(@company)
    else
      flash[:error] = "Oops! It looks like there was an error."
      redirect_to new_company_path
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    flash[:danger] = "Item deleted"
    redirect_to root_path
  end

  private

  def is_owner?
    return if Company.find(params[:id]).id == current_user.company_id
    flash[:danger] = "Unauthorized"
    redirect_to items_path
  end

  def company_params
    params.require(:company).permit(:name, :description, :line_1, :line_2, :line_3, :city, :county_province, :zip_or_postcode, 
      :country, :other_address_details, :phone, :email)
  end
end
