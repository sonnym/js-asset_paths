require 'minitest/autorun'

require 'pry'

ENV['RAILS_ENV'] = 'test'
require 'sprockets/railtie'
require 'rails/test_unit/railtie'
require 'rails/test_help'

require File.expand_path('../../lib/js_asset_paths.rb', __FILE__)

ActiveSupport.test_order = :random

class App < Rails::Application
  config.eager_load = true

  config.assets.enabled = true
  config.assets.initialize_on_precompile = true
end
