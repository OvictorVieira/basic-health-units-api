Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  devise_for :users

  namespace :api do
    namespace :v1 do

      post 'login', to: 'users#login', as: :login
      post 'logout', to: 'users#logout', as: :logout
    end
  end

end
