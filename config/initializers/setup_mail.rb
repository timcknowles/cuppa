ActionMailer::Base.smtp_settings = {

  address: ENV['address'],
  port: ENV['port'],
  domain: ENV['domain'],
  user_name: ENV['user_name'],
  password: ENV['password'],
  :authentication       => "plain",
  :enable_starttls_auto => true
}

require 'development_mail_interceptor'
ActionMailer::Base.default_url_options[:host] = "localhost:3000"
ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?