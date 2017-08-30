#!/usr/bin/env rake
require 'rubygems'
require 'rubygems/package'

require 'bundler/setup'
require 'bundler/gem_tasks'

require 'rake/testtask'

require 'zlib'

Rake::TestTask.new do |t|
  t.libs << 'lib/js_asset_paths'
  t.test_files = FileList['test/{unit,integration}/*_test.rb']
  t.verbose = true
end

desc('Verify contents of generated package')
task(:build) do
  File.open("pkg/js-asset_paths-#{JsAssetPaths::VERSION}.gem", 'r') do |file|
    Gem::Package::TarReader.new(file) do |tar|
      data = tar.detect { |entry| entry.full_name == 'data.tar.gz' }

      Gem::Package::TarReader.new(Zlib::GzipReader.wrap(data)) do |contents|
        file_names = contents.each_entry.map(&:full_name)

        unless file_names.count == 8
          fail "Build contents are inconsistent:\n #{file_names.join("\n ")}\n\n"
        end
      end
    end
  end
end

task default: :test
