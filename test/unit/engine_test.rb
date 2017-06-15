require_relative '../test_helper'

describe JsAssetPaths::Engine do
  it 'permit initializing the application' do
    App.initialize! unless App.initialized?
  end
end
