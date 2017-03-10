require_relative 'boot'

require 'rails'
require 'active_model/railtie'
require 'action_controller/railtie'
# require 'active_record/railtie'
# require "active_job/railtie"
# require "action_mailer/railtie"
# require "action_view/railtie"
# require "action_cable/engine"
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module GotenyamaTrustBusApi
  class Application < Rails::Application
    config.api_only = true

    config.generators do |g|
      g.test_framework :rspec
      g.view_specs false
    end

    # timezone
    config.time_zone = 'Tokyo'

    # i18n
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    I18n.enforce_available_locales = true
    config.i18n.default_locale = :en

    # autoload
    config.autoload_paths += %W(#{config.root}/lib)
    config.eager_load_paths += %W(#{config.root}/lib)
  end
end
