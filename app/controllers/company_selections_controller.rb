class CompanySelectionsController < ApplicationController
  def new
    @companies = Company.all
  end

  def create
    
  end
end
