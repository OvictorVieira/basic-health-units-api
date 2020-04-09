Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  scope :api, defaults: { format: :json } do
    devise_for :users, skip: :sessions

    devise_scope :user do

      get 'sign_in', to: 'devise/sessions#new'
    end
  end

  namespace :api do
    namespace :v1 do

      devise_scope :user do

        post 'sign_in', to: 'sessions#login', as: :login
        post 'sign_out', to: 'sessions#logout', as: :logout
      end
    end
  end
end
