Rails.application.routes.draw do

  resources :rebuttles
  get 'search/index'

  resources :user_roles, only: [:new, :create, :edit, :destroy]
  get 'uploads/new'

  resources :search, only: [:index]

  get 'uploads/create'

  get '/conferences/search'

  get 'users/search'

  get 'users/set_user_role'

  get 'uploads/index'

  devise_for :users
  get 'welcome/index'

  resources :tracks

  get "/show_needs_reviewing" => 'tracks#show_needs_reviewing', as: 'show_needs_reviewing'
  get "/show_reviewed" => 'tracks#show_reviewed', as: 'show_reviewed'
  get "/show_accepted" => 'tracks#show_accepted', as: 'show_accepted'
  get "/show_users" => 'tracks#show_users', as: 'show_users'

  get "/show_joined" => 'users#show_joined', as: 'show_joined'
  get "/show_owned" => 'users#show_owned', as: 'show_owned'
  get "/show_contributed" => 'users#show_contributed', as: 'show_contributed'
  get "/show_contacts" => 'users#show_contacts', as: 'show_contacts'
  resources :users
  resources :conferences
  resources :reviews
  resources :requests do
    member do
      get :set_chairable
    end
  end
  resources :requests
  resources :connections
  resources :notifications


  resources :papers, only: [:index, :new, :edit, :create, :destroy]


  resources :tracks do
    member do
      get 'add_user'
    end
  end

  resources :papers do
    resources :reviews
  end

  # devise_for :members, :controllers => { :registrations => "registrations" }

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
