# coding: utf-8
require_relative 'lib/js_asset_paths/version'

Gem::Specification.new do |spec|
  spec.name          = 'js-asset_paths'
  spec.version       = JsAssetPaths::VERSION
  spec.authors       = ['Sonny Michaud']
  spec.email         = ['michaud.sonny@gmail.com']
  spec.description   = 'Access paths to compiled assets from in javascript.'
  spec.summary       = spec.description
  spec.homepage      = 'https://github.com/sonnym/js-asset_paths'
  spec.license       = 'MIT'

  spec.files         = Dir['lib/*.rb']
  spec.test_files    = Dir['test/*/*_test.rb']
  spec.require_paths = ['lib']

  spec.add_runtime_dependency('rails', ['>= 4.0', '< 5.2'])

  spec.add_development_dependency('bundler', '~> 1.3')
  spec.add_development_dependency('rake', '~> 12')
  spec.add_development_dependency('pry', '~> 0')

  spec.add_development_dependency('appraisal', '~> 2.2')
  spec.add_development_dependency('execjs', '~> 2.7')
  spec.add_development_dependency('therubyracer', '~> 0')
end
