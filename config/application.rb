require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'carrierwave'
require 'carrierwave/orm/activerecord'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Workspace
  class Application < Rails::Application
    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'
    
    config.before_configuration do
      env_file = File.join(Rails.root, 'config', 'local_env.yml')
      YAML.load(File.open(env_file)).each do |key, value|
        ENV[key.to_s] = value
      end if File.exists?(env_file)
    end
    
    config.active_record.raise_in_transactional_callbacks = true
    config.action_view.embed_authenticity_token_in_remote_forms = true
    
    config.action_mailer.default_url_options = { :host => ENV['app_host'] }
    config.action_mailer.delivery_method = :smtp
  
    config.action_mailer.smtp_settings = {
        :address => "smtp.gmail.com",
        :port => 587,
        :domain => "gmail.com",
        :user_name => ENV['gmail_username'],
        :password => ENV['gmail_password'],
        :authentication => "plain",
        :enable_starttls_auto => true
    }
  end
end
