Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :cities
  resources :gossips
  
  resources :users do
    resources :gossips
  end
  
  resources :gossips do
    resources :coms
  end

  resources :sessions, only: [:new, :create, :destroy]
  

  root to: 'pages#home'
  
  get'/team', to: 'team#team'
  get'/contact', to: 'team#contact'

  get '/welcome/(:name)', to: 'pages#welcome'

  # routes inutiles du fait de resources gossips et users présents
  get'/gossip/gossip:id', to: 'gossips#show'
  get'/user/user:id', to: 'users#show'

end
