# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Cw2::Application.initialize!


ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => 'arvando',
  :password       => 'syruppy',
  :domain         => 'https://arcane-ravine-1260.herokuapp.com',
  :enable_starttls_auto => true
}

