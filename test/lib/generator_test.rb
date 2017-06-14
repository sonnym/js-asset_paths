require 'execjs'
require_relative '../test_helper'

describe JsAssetPaths::Generator do
  before do
    App.initialize! unless App.initialized?

    JsAssetPaths::Generator.environment = Rails.application
    @output = JsAssetPaths::Generator.generate!
  end

  it 'is idempotent' do
    assert_equal @output, JsAssetPaths::Generator.generate!
  end

  it 'output is a string' do
    assert_kind_of String, @output
  end

  it 'output evaluates as valid javascript' do
    ExecJS.eval(@output)
  end

  it 'output evaluates to a hash' do
    assert_kind_of Hash, ExecJS.eval(@output)
  end

  it 'output has corresponding key and value pairs' do
    map = ExecJS.eval(@output)

    map.each do |key, value|
      file = key.split('/').second
      name, _, ext = file.rpartition('.')

      assert_match /#{name}-[0-9,a-z]{64}.#{ext}/, value
    end
  end
end
