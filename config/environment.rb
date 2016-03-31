# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.office365.com',
  :port           => '587',
  :authentication => :login,
  :user_name      => ENV['SMTP_USERNAME'],
  :password       => ENV['SMTP_PASSWORD'],
  :domain         => 'aluxurelife.com',
  :enable_starttls_auto => true
 }