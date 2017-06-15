require 'execjs'
require_relative '../test_helper'

describe 'generated javascript' do
  before do
    App.initialize! unless App.initialized?
    JsAssetPaths::Generator.environment = Rails.application

    @js_file_contents = ERB.new(File.read('app/assets/javascripts/js-asset_paths.js.erb')).result(binding)
    @js_context = ExecJS.compile(@js_file_contents)
  end

  it 'PathHelper is an object' do
    assert_equal 'object', @js_context.eval('typeof PathHelper')
  end

  it 'PathHelper.assetPath is a function' do
    assert_equal 'function', @js_context.eval('typeof PathHelper.assetPath')
  end

  it 'PathHelper.fontPath is a function' do
    assert_equal 'function', @js_context.eval('typeof PathHelper.fontPath')
  end

  it 'PathHelper.imagePath is a function' do
    assert_equal 'function', @js_context.eval('typeof PathHelper.imagePath')
  end

  it 'PathHelper.javascriptPath is a function' do
    assert_equal 'function', @js_context.eval('typeof PathHelper.javascriptPath')
  end

  it 'PathHelper.stylesheetPath is a function' do
    assert_equal 'function', @js_context.eval('typeof PathHelper.stylesheetPath')
  end
end
