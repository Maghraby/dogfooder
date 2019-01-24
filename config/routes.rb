Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :fooders, only: [:create]

  require 'sidekiq/web'

  mount Sidekiq::Web => '/sidekiq'
  # allow sidekiq sharet the rails session, to prevent the 'forbidden' error
  Sidekiq::Web.set :session_secret, Rails.application.secrets[:secret_token]
  Sidekiq::Web.set :sessions, Rails.application.config.session_options
end
