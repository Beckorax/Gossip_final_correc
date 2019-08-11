Rails.application.routes.draw do
  resources :users
  resources :gossips do
    resources :comments
    resources :tags
    resources :likes, only: [:create, :destroy]
  end
  resources :cities
  resources :sessions, only: [:new, :create, :destroy]
  
  resources :conversations do
    resources :messages
  end
  
  
  get 'profile', to: 'static_pages#profile'
  get 'contact', to: 'static_pages#contact'
  get 'team', to: 'static_pages#team'
  root 'home#index'

end
