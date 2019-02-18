Rails.application.routes.draw do
  namespace :admin do
    resource :dashboard, only: :index
    resources :posts
    root to: 'dashboard#index'
  end
  scope module: 'frontend' do
    resources :home, only: :index
    root to: 'home#index'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy', as: :signout
  end
  resources :dashboard
  root to: 'home#index'
  authenticated :user do
    root to: 'dashboad#index'
  end
  resources :news, param: :slug

end
