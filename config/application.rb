require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Miredo
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.autoload_paths += %W(#{config.root}/lib)

    # set a lone admin email for now
    config.admin_email = "tendrepeches@protonmail.com"

    config.inquiries_email = "admin@miredo.ca"

    config.no_reply_email = "no-replay@miredo.ca"
  end
end
