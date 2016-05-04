Eventosiglesia::Application.configure do
  # Hobo: tell ActiveReload about dryml
  config.watchable_dirs[File.join(config.root, 'app/views')] = ['dryml']
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  config_time_zone="DST"

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  #config.action_mailer.raise_delivery_errors = false
  require 'tlsmail'
  config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => 25,
    :domain => "gmail.com",
    :user_name => "javisvmusic@gmail.com",
    :password => "RealMadrid7",
    :authentication => :login,
    enable_starttls_auto: true
    }

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  config.paperclip_defaults = {
    :storage => :s3,
    :s3_region => 'us-east-1',
    :s3_credentials => {
      :bucket =>'ciaeventos', 
      :access_key_id => 'AKIAJLCMNNSWMSVQ4WSA', 
      :secret_access_key => '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'
    }
    
  }
  #ENV['AWS_REGION']=>

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
end
