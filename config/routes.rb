Rails.application.routes.draw do
  get 'add_book', to: 'add_book#index'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
