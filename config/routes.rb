Rails.application.routes.draw do
  resources :categories
    # Defines the root path route ("/")
  # root "posts#index"
  # root "products#index"
   #Cuando soliciten /products devuelvo el controlador products como me va a devolver un conjunto de cosas le agrego como nombre de metodo index
  # post '/products',     to: 'products#create'
  # get  '/products/new', to: 'products#new', as: :new_product
  # get  '/products',     to: 'products#index'
  # get  '/products/:id', to: 'products#show', as: :product
  # get  '/products/:id/edit', to: 'products#edit', as: :edit_product
  # patch '/products/:id', to: 'products#update'
  # delete '/products/:id', to: 'products#destroy'
  #Escribir resources products es equivalente a poner las 7 lineas de arriba
  resources :products, path: '/'
  resources :categories, except: :show

  namespace :authentication, path: '', as: '' do
    resources :users, only: [:new, :create]
    resources :sessions, only: [:new, :create]
  end
end
