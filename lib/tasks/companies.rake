namespace :companies do
  desc "TODO"
  task add_empty_fields: :environment do
    Company.update_all(number_of_locations: "1", annual_revenue: "Less than $250,000", url: "http://www.example.com/")
  end

end
