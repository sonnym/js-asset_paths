require 'js_asset_paths/version'
require 'js_asset_paths/engine'
require 'js_asset_paths/generator'

module JsAssetPaths
  ASSET_METHODS = ActionView::Helpers::AssetUrlHelper.public_instance_methods.grep(/^((?!.*asset)[a-z]+)_path$/)
end
