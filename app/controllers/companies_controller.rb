class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :is_owner?, only: [:edit, :update, :destroy]
  # before_action :has_paid?, only: :create

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.create(company_params)
    if @company.save
      current_user.update(company_id: @company.id)
      flash[:success] = "New company created"
      redirect_to company_path(@company)
    else
      flash[:error] = "Oops! It looks like there was an error."
      redirect_to new_company_path
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    @company.update(company_params)
    return redirect_to company_path(@company) if @company.save
    flash[:danger] = "Woops, looks like something went wrong. Please try again."
    render :edit
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    flash[:danger] = "Item deleted"
    redirect_to root_path
  end

  private

  # def has_paid?
  #   return if current_user.paid
  #   flash[:danger] = "You must subscribe before registering a company"
  #   redirect_to new_charge_path
  # end

  def is_owner?
    return if Company.find(params[:id]).id == current_user.company_id
    flash[:danger] = "Unauthorized"
    redirect_to root_path
  end

  def company_params
    params.require(:company).permit(:name, :description, :line_1, :line_2, :line_3, :city, :county_province, :zip_or_postcode, 
      :country, :other_address_details, :phone, :email, :photo, :url, :annual_revenue, :number_of_locations)
  end
end
