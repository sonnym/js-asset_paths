require 'action_dispatch'
require 'rails/engine'

module JsAssetPaths
  class Engine < Rails::Engine
    JS_ASSET_PATHS_FILE = 'js-asset_paths'

    isolate_namespace(JsAssetPaths)

    initializer('js-assets_paths.compile', after: 'sprockets.environment') do |application|
      JsAssetPaths::Generator.environment = application
    end
  end
end
