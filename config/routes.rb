Rails.application.routes.draw do
  resources :entries, defaults: { format: 'json' }
  
  root 'home#index'
  get 'add_book', to: 'add_book#index'
  get 'add_book/similar', to: 'add_book#similar'
  post '/add_book', to: 'add_book#create'
  get 'search_book', to: 'search_book#index'
  post '/search_book', to: 'search_book#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
