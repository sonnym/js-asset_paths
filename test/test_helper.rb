require 'simplecov'
SimpleCov.start

require 'minitest/autorun'

require 'pry'

ENV['RAILS_ENV'] = 'test'
require 'sprockets/railtie'
require 'rails/test_unit/railtie'
require 'rails/test_help'

require File.expand_path('../../lib/js_asset_paths.rb', __FILE__)
require File.expand_path('../support/application.rb', __FILE__)

ActiveSupport.test_order = :random if ActiveSupport.respond_to?(:test_order)
