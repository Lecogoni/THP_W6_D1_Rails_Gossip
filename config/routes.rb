Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :gossips
  resources :users
  
  root to: 'pages#home'
  
  get'/team', to: 'team#team'
  get'/contact', to: 'team#contact'

  get '/welcome/(:name)', to: 'pages#welcome'

  # routes inutiles du fait de resources gossips et users présents
  get'/gossip/gossip:id', to: 'gossips#show'
  get'/user/user:id', to: 'users#show'

end
