Rails.application.routes.draw do
  get 'users/new'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'login', to: 'login#index'
  post 'create', to: 'login#create'
  post 'check', to: 'login#check'

end
