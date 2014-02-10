module JsAssetPaths
  class Generator
    cattr_accessor :environment, :context

    def self.generate!
      asset_hash.to_json
    end

    private

    def self.asset_hash
      assets.each_file.each_with_object({}) do |filepath, memo|
        memo[filepath.relative_path_from(base_asset_path)] = output_path(filepath)
      end
    end

    def self.base_asset_path
      @base_asset_path || Rails.root.join('app', 'assets')
    end

    def self.output_path(filepath)
      if context.digest_assets?
        "#{filepath.basename(filepath.extname)}-#{assets.file_digest(filepath)}#{filepath.extname}"
      else
        filepath.basename.to_s
      end
    end

    def self.assets
      environment.assets
    end
  end
end
