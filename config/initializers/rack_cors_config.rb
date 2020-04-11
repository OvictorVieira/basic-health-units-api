# Doc: https://www.rubydoc.info/gems/rack-cors/0.4.0

Rails.application.config.middleware.insert_before 0, Rack::Cors do

  allow do
    origins '*'
    resource '*',
             headers: :any,
             methods: [:get, :patch, :put, :delete, :post, :options]
  end
end