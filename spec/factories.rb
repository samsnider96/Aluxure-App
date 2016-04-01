include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :admin_user do
    
  end

  factory :user do
    id 1
    first_name "John"
    last_name  "Doe"
    sequence(:email, 100) { |n| "person#{n}@example.com" }
    phone "201-652-1441"
    password "password"
    password_confirmation "password" 
    confirmed_at          Time.now 
  end

  factory :company do
    id 1
    sequence(:name, 100) { |n| "company_#{n}" }
    description "Lorem ipsum"
    line_1 "line_1"
    line_2 "line_2"
    line_3 "line_3"
    city "Chapel Hill"
    county_province "county"
    zip_or_postcode "27514"
    country "USA"
    other_address_details "etc. etc."
    phone "201-652-1441"
    email "example@example.com"
    annual_revenue "200000"
    number_of_locations "1"
  end

  factory :comment do
    text "lorem ipsum this is a text"
    appointment_request_id 1
    user_id 1
  end

  factory :image_upload do
    id 1
  end

  factory :item do
    id 1
    user_id 1
    image_upload_id 1
    brand "brand"
    category "Shirt"
    color "Color"
    size "Size"
    material "Material"
    condition "normal"
    description "blah"
    gender "Mens"
  end

  factory :appointment_request do
    company_id 1
    user_id 1
    start_time DateTime.yesterday
    end_time DateTime.now
  end

  factory :appointment_item do
    appointment_request_id 1
    item_id 1
    status AppointmentItem::STATUS[0]
  end

  factory :product_image do 
    item_id 1
    photo { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'files', 'test.jpg')) }
  end

end