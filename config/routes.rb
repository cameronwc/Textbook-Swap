Rails.application.routes.draw do
  resources :entries, defaults: { format: 'json' }
  
  get 'sessions/new'
  get 'users/new'
  root 'home#index'

  get 'add_book', to: 'add_book#index'
  get 'add_book/similar', to: 'add_book#similar'
  post '/add_book', to: 'add_book#create'

  get 'search_book', to: 'search_book#index'
  post '/search_book', to: 'search_book#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'login', to: 'login#index'
  post 'create', to: 'login#create'
  post 'check', to: 'login#check'
  delete 'logout',  to: 'login#destroy'

  resources :users

end
