FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name  "Doe"
    sequence(:email, 100) { |n| "person#{n}@example.com" }
    phone "201-652-1441"
    password "password"
    password_confirmation "password"  
  end

  factory :company do
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
  end

  factory :comment do
    text "lorem ipsum this is a text"
    appointment_request_id 1
  end

  factory :appointment_request do
    company_id 1
    user_id 1
    start_time DateTime.yesterday
    end_time DateTime.now
  end

end