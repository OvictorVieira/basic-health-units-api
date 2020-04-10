Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  devise_for :users, skip: :all

  devise_scope :user do

    post 'api/v1/sign_up', to: 'api/v1/registrations#create',
                           :defaults => { :format => 'json' }
  end

  namespace :api do
    namespace :v1 do

      devise_scope :user do

        post 'sign_in', to: 'sessions#login', as: :login
        post 'sign_out', to: 'sessions#logout', as: :logout

        get 'find_ubs', to: 'institutes#find_ubs'
      end
    end
  end
end
