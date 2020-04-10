source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

gem 'rails', '~> 6.0.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'httparty'

gem 'whenever', require: false

gem 'redis'
gem 'sidekiq'

gem 'devise'
gem 'simple_token_authentication', '~> 1.17'

gem 'active_model_serializers', '~> 0.10.0', require: true, github: 'rails-api/active_model_serializers', branch: '0-10-stable'

gem 'kaminari'
gem 'api-pagination'

gem 'activerecord-postgis-adapter'
gem 'geocoder'

gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails', '~> 0.3.9'

  gem 'rspec-rails', '~> 4.0.0.beta4'

  gem 'pry-remote'
end

group :development do
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'

  gem "rubycritic", require: false

  gem 'factory_bot_rails'

  gem 'faker'
  gem 'webmock'
  gem 'vcr'
end
