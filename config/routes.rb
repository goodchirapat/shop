Rails.application.routes.draw do
  resources :inventories
  get 'main/login'
  get 'main/create'
  get 'main/destroy'
  get 'main/user_item' , 'to:main#user_item'
  get 'shop/:id' , to: 'main#shop'
  get 'main/inventories' ,to: 'main#show_inventory'
  post 'main/create' , to: 'main#create'
  post 'main/buy' , to: 'main#buy'
  resources :items
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
