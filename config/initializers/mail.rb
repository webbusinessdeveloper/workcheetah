ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.mandrillapp.com',
  :port           => 'smtp.mandrillapp.com',
  :authentication => :plain,
  :user_name      => ENV['MANDRILL_USERNAME'],
  :password       => ENV['MANDRILL_PASSWORD'],
  :domain         => 'heroku.com',
  :enable_starttls_auto => true
}

if Rails.env.development?
  ActionMailer::Base.default_url_options = {:host => "localhost:3000"}
elsif Rails.env.production?
  ActionMailer::Base.default_url_options = {:host => "www.workcheetah.com"}
end