class AddRequestsCountToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :appointment_requests_count, :integer, default: 0

    Company.reset_column_information
    Company.all.each do |company|
      Company.update_counters company.id, appointment_requests_count: company.appointment_requests.length
    end
  end
end
