class CompanySelectionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @companies = Company.all
  end

  def create
    
  end
end
