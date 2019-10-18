require_relative 'boot'

require 'csv'
require 'rails/all'

Bundler.require(*Rails.groups)

module AccoutsKeeper
  class Application < Rails::Application
    config.load_defaults 5.2

    config.time_zone = 'Asia/Tokyo'

    config.i18n.default_locale = :ja
    
    config.generators do |g| 
      g.test_framework :rspec, 
         fixtures: true, 
         view_specs: false,
         helper_specs: false,
         routing_specs: false, 
         controller_spacs: false,
         request_specs: false  
      g.fixture_replacement :factory_bot, dir: "spec/factories"
    end
    config.assets.initialize_on_precompile = false

  end
end
