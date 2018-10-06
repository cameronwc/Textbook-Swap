Rails.application.routes.draw do
  root 'home#index'
  get 'add_book', to: 'add_book#index'
  post '/add_book', to: 'add_book#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
