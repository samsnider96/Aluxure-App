ActiveAdmin.register Company do

permit_params :name, :description, :line_1, :line_2, :line_3, :city, :county_province, :zip_or_postcode, 
      :country, :other_address_details, :phone, :email, :photo, :url, :annual_revenue, :number_of_locations

  index do
    selectable_column
    id_column
    column "Appointment Request Count", sortable: 'appointment_request_count' do |company|
      company.appointment_requests_count
    end
    column :name
    column :phone
    column :email
    column :url
    column :annual_revenue
    column :number_of_locations
    column :description
    column :line_1
    column :line_2
    column :line_3
    column :city
    column :county_province
    column :zip_or_postcode
    column :country
    column :other_address_details 
    column :photo  
    actions
  end

  filter "Appointment Request Count", sortable: 'appointment_request_count' do |company|
    company.appointment_requests_count
  end
  filter :name
  filter :phone
  filter :email
  filter :url
  filter :annual_revenue
  filter :number_of_locations
  filter :description
  filter :line_1
  filter :line_2
  filter :line_3
  filter :city
  filter :county_province
  filter :zip_or_postcode
  filter :country
  filter :other_address_details 
  filter :photo

  form do |f|
    f.inputs "User Details" do
       f.input :name 
       f.input :description 
       f.input :line_1 
       f.input :line_2 
       f.input :line_3 
       f.input :city 
       f.input :county_province 
       f.input :zip_or_postcode 
       f.input :country 
       f.input :other_address_details 
       f.input :phone 
       f.input :email 
       f.input :url, label: "Website" 
       f.input :number_of_locations, collection: Company::LOCATION_NUMBER_OPTIONS, label: 'Number of Locations' 
       f.input :annual_revenue, collection: Company::ANNUAL_REVENUE_OPTIONS, label: 'Annual Revenue' 
    end
    f.actions
  end


end
