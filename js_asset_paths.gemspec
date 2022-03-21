# coding: utf-8
require_relative 'lib/js_asset_paths/version'

Gem::Specification.new do |spec|
  spec.name          = 'js-asset_paths'
  spec.version       = JsAssetPaths::VERSION
  spec.authors       = ['Sonny Michaud']
  spec.email         = ['michaud.sonny@gmail.com']
  spec.summary       = 'Access paths to compiled assets from in javascript.'
  spec.homepage      = 'https://github.com/sonnym/js-asset_paths'
  spec.license       = 'MIT'

  spec.files         = Dir['{app,lib}/**/*'] | %w(LICENSE README.md)
  spec.require_paths = ['lib']

  spec.add_runtime_dependency('rails', ['>= 4.2', '< 6.2'])
  spec.add_runtime_dependency('sprockets', ['>= 2.0', '< 4'])

  spec.add_development_dependency('bundler', '>= 2.0')
  spec.add_development_dependency('rake', '>= 12')
  spec.add_development_dependency('pry', '~> 0')

  spec.add_development_dependency('appraisal', '~> 2.2')
  spec.add_development_dependency('execjs', '~> 2.7')
  spec.add_development_dependency('mini_racer', '~> 0.6.2')

  spec.add_development_dependency('codeclimate-test-reporter', '~> 1')
end
