Rails.application.routes.draw do
	namespace :v1, defaults: {format: 'json'} do
     	resources :carts
  		resources :orders
  		resources :products
  		resources :users
  	end
    delete 'carts/del'
  resources :carts
  resources :orders
  resources :products
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
