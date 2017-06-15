module JsAssetPaths
  class Generator
    cattr_accessor :environment

    def self.generate!
      asset_hash.to_json
    end

    private

    # Note: In sprockets 2, `each_file` yields a `Pathname`. In 3,
    # it yields a string. This method supports both.
    def self.asset_hash
      assets.each_file.each_with_object({}) do |filepath, memo|
        path = ::Pathname.new(filepath.to_s)
        relative_path = path.relative_path_from(base_asset_path)

        memo[relative_path] = output_path(path) if local?(relative_path)
      end
    end

    def self.base_asset_path
      @base_asset_path ||= Rails.root.join('app', 'assets')
    end

    def self.output_path(filepath)
      unless digest?.in?([true, false])
        raise TypeError.new('Expected ::Rails.application.config.assets.digest to be boolean')
      end

      if digest?
        # Convert the byte string into hexadecimal
        dgst = assets.file_digest(filepath).unpack('H*')[0]
        "#{filepath.basename(filepath.extname)}-#{dgst}#{filepath.extname}"
      else
        filepath.basename.to_s
      end
    end

    def self.assets
      environment.assets
    end

    def self.digest?
      ::Rails.application.config.assets.digest
    end

    def self.local?(filepath)
      !(filepath.to_s =~ /\.\.\//)
    end
  end
end
