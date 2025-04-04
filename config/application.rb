require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ChatApp
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
    config.view_component.view_component_path = "app/views/components"
    config.eager_load_paths << Rails.root.join("app/views/components")
    # Don't generate system test files.
    config.generators do |g|
      g.test_framework nil  # This disables all test framework generators
      g.fixture_replacement nil
    end
  end
end
