Rails.application.routes.draw do

  devise_for :users
  get 'welcome/index'

  resources :tracks
  resources :users
  resources :conferences
  resources :reviews

  resources :papers, only: [:index, :new, :edit, :create, :destroy]


  # devise_for :members, :controllers => { :registrations => "registrations" }

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
