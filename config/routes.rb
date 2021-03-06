Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'homes#index'

  get 'signup', to: 'users#new'
  get 'login',  to: 'sessions#new'
  get 'search', to: 'schools#search'

  post 'login',       to: 'sessions#create'
  post 'guest_login', to: 'guest_sessions#create'

  delete 'logout', to: 'sessions#destroy'

  resources :beginners, only: [:index]
  resources :users,     only: [:new, :create, :edit, :update, :destroy]
  resources :schools,   only: [:index, :show, :new, :create, :edit, :update, :destroy, :search]

  resources :reviews, only: [:new, :create] do
    resources :likes, only: [:create]
  end
end
