# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Cw2::Application.initialize!

::APP_CONFIG = YAML.load_file("#{Rails.root}/config/config.yml")

ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ::APP_CONFIG['sendgrid_username'],
  :password       => ::APP_CONFIG['sendgrid_password'],
  :domain         => 'https://arcane-ravine-1260.herokuapp.com',
  :enable_starttls_auto => true
}



