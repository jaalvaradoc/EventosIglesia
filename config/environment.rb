# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Eventosiglesia::Application.initialize!

Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)
