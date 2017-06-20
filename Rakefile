#!/usr/bin/env rake
require 'rubygems'

require 'bundler/setup'
require 'bundler/gem_tasks'

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'lib/js_asset_paths'
  t.test_files = FileList['test/{lib,integration}/*_test.rb']
  t.verbose = true
end

task default: :test
