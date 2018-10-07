Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'login', to: 'login#index'
  post 'create', to: 'login#create'
  post 'check', to: 'login#check'
  delete 'logout',  to: 'login#destroy'

  resources :users

end
