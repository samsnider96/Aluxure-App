namespace :company do
  desc "TODO"
  task convert_to_company_user: :environment do
    User.where.not(company_id: nil).each {|user| user.update(type: "CompanyUser")}
  end

end
