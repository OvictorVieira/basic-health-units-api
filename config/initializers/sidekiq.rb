require 'sidekiq/web'

url_redis = Rails.application.config.app.redis.host

redis_conn = proc {
  if Rails.env.production?
    Redis.new(host: url_redis,
              port: Rails.application.config.app.redis.port)
  else
    Redis.new(host: url_redis,
              port: Rails.application.config.app.redis.port,
              user: Rails.application.config.app.redis.user,
              password: Rails.application.config.app.redis.password)
  end
}

Sidekiq.configure_client do |config|
  config.redis = ConnectionPool.new(size: 5, &redis_conn)
end

Sidekiq.configure_server do |config|
  config.redis = ConnectionPool.new(size: 25, &redis_conn)
end

Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
  Rack::Utils.secure_compare(::Digest::SHA256.hexdigest(user), ::Digest::SHA256.hexdigest(Rails.application.config.app.sidekiq.user.to_s)) &
    Rack::Utils.secure_compare(::Digest::SHA256.hexdigest(password), ::Digest::SHA256.hexdigest(Rails.application.config.app.sidekiq.password.to_s))
end
