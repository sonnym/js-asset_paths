class App < Rails::Application
  config.eager_load = true

  config.assets.enabled = true
  config.assets.initialize_on_precompile = true

  if Gem::Version.new(Rails.version) < Gem::Version.new('4.2')
    config.assets.digest = true
  end
end
