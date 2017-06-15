require 'execjs'
require_relative '../test_helper'

describe 'untrue values of config.assets.digest' do
  before do
    App.initialize! unless App.initialized?
  end

  it 'output has corresponding key and value pairs when digest is false' do
    begin
      Rails.application.config.assets.digest = false

      JsAssetPaths::Generator.environment = Rails.application
      @output = JsAssetPaths::Generator.generate!

      map = ExecJS.eval(@output)

      map.each do |key, value|
        file = key.split('/').second
        assert_equal file, value
      end

    ensure
      Rails.application.config.assets.digest = true
    end
  end

  it 'output has corresponding key and value pairs when digest is not boolean' do
    begin
      Rails.application.config.assets.digest = :foo

      JsAssetPaths::Generator.environment = Rails.application

      assert_raises(TypeError) { JsAssetPaths::Generator.generate! }
    ensure
      Rails.application.config.assets.digest = true
    end
  end
end
