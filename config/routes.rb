Rails.application.routes.draw do
  root 'home#index'

  devise_for :users
  resources :users, only: [:index, :update, :show]
  get 'avatar', to: "users#avatar"

  resources :products do
    resources :pictures, only: [:new]
    member do
      post 'like'
      post 'look'
      patch 'add'
      patch 'down'
    end
    collection do
      match 'search' => 'products#search', via: [:get, :post], as: :search
    end
  end
  resources :pictures, only: [:show, :create, :destroy]

  #resources :catalog, only: [:index, :show]

  resources :catalogs do
    member do
      get 'subcatalogs'
    end
  end

  resources :carts

  resources :line_items, only: [:create, :destroy]

  resources :orders do
    member do
      post :recieve, to: "orders#recieve"
      post :paytype, to: "orders#paytype"
      get :process, to: "orders#process_order"
    end
  end

  resources :recievers


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
