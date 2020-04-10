require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BasicHealthUnits
  class Application < Rails::Application
    config.load_defaults 6.0

    config.assets.initialize_on_precompile = false

    config.app = OpenStruct.new
    config.app.redis = OpenStruct.new
    config.app.postgis = OpenStruct.new
    config.app.sidekiq = OpenStruct.new

    config.app.redis.host = Rails.application.credentials[:redis][Rails.env.to_sym][:host]
    config.app.redis.port = Rails.application.credentials[:redis][Rails.env.to_sym][:port]
    config.app.redis.user = Rails.application.credentials[:redis][Rails.env.to_sym][:user]
    config.app.redis.password = Rails.application.credentials[:redis][Rails.env.to_sym][:password]

    config.app.postgis.host = Rails.application.credentials[:postgis][Rails.env.to_sym][:host]
    config.app.postgis.user = Rails.application.credentials[:postgis][Rails.env.to_sym][:user]
    config.app.postgis.password = Rails.application.credentials[:postgis][Rails.env.to_sym][:password]
    config.app.postgis.database = Rails.application.credentials[:postgis][Rails.env.to_sym][:database]

    config.app.sidekiq.user = Rails.application.credentials[:sidekiq][Rails.env.to_sym][:user]
    config.app.sidekiq.password = Rails.application.credentials[:sidekiq][Rails.env.to_sym][:password]
  end
end
