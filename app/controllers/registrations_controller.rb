class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    return root_path unless resource.type == "CompanyUser"
    new_company_path
  end
end