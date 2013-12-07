module JsAssetPaths
  class Generator
    cattr_accessor :environment, :context

    def self.generate!
      asset_hash.to_json
    end

    private

    def self.asset_hash
      manifest.files.reduce({}) do |memo, (key, value)|
        memo.merge(value['logical_path'] => (context.digest_assets? ? key : value['logical_path']))
      end
    end

    def self.manifest
      Sprockets::Manifest.new(environment.assets.index, './public/assets')
    end
  end
end
