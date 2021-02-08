Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'pages#home'

  get'/team', to: 'team#team'
  get'/contact', to: 'team#contact'

end
