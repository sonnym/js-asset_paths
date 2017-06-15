require 'minitest/autorun'

require 'pry'

ENV['RAILS_ENV'] = 'test'
require 'sprockets/railtie'
require 'rails/test_unit/railtie'
require 'rails/test_help'

require File.expand_path('../../lib/js_asset_paths.rb', __FILE__)

ActiveSupport.test_order = :random if ActiveSupport.respond_to?(:test_order)

class App < Rails::Application
  config.eager_load = true

  config.assets.enabled = true
  config.assets.initialize_on_precompile = true

  if Gem::Version.new(Rails.version) < Gem::Version.new('4.2')
    config.assets.digest = true
  end
end
