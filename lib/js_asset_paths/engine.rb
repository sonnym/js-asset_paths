module JsAssetPaths
  class Engine < Rails::Engine
    JS_ASSET_PATHS_FILE = 'js-asset_paths'

    isolate_namespace(JsAssetPaths)

    initializer('js-assets_paths.compile', after: 'sprockets.environment') do |application|
      application.assets.register_preprocessor('application/javascript', :'js-assets_path.compile') do |context, data|
        if context.logical_path == JS_ASSET_PATHS_FILE
          JsAssetPaths::Generator.environment = application
          JsAssetPaths::Generator.context = context
        end

        data
      end
    end
  end
end
