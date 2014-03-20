Statusapp::Application.routes.draw do
  get "profiles/show"
  devise_for :users

  devise_scope :user do
    get 'sign_up', to: 'devise/registrations#new', as: :sign_up
    get 'login', to: 'devise/sessions#new', as: :login
    get 'logout', to: 'devise/sessions#destroy', as: :logout
  end

  resources :statuses
  get 'feed', to: 'statuses#index', as: :feed
  root to: 'statuses#index'

  get '/:id', to: 'profiles#show'
end
