Rails.application.routes.draw do
  get 'investments/index'
  get 'investments/show'
  get 'investments/new'
  get 'investments/create'
  get 'campaigns/index'
  get 'campaigns/show'
  get 'campaigns/new'
  get 'campaigns/create'

  get 'docusign' => 'docusign#get'
  post 'docusign' => 'docusign#create'

  # get '/docusign', to: 'docusign#get', as: :docusign
  # post '/docusign', to:'docusign#create', as: :docusign_sign

  get '/ds/mustAuthenticate' => 'ds_common#ds_must_authenticate'
  get '/ds/login' => redirect('/auth/docusign')
  get '/auth/:provider/callback', to: 'session#create'

  get '/ds/logout', to: 'session#destroy'

  devise_for :users
  root to: 'pages#home'

  get "/dashboard", to: 'pages#dashboard', as: :dashboard
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :campaigns, only: [:index, :show] do
    resources :investments, only: [:new, :create]
end
  resources :investments, only: [:index, :show]
end
