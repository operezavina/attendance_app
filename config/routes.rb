AttendanceApp::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  resources :projects
  resources :events
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  #resources :posts, only: [:create, :destroy, :index, :update]
  # You can have the root of your site routed with "root"

  get "static_pages/home"
  root  'static_pages#home'
  match '/export',  to: 'users#export',            via: 'get'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/endday',  to: 'sessions#endday',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/home', to: 'static_pages#home', via: 'get'
  match '/events', to: 'events#index', via: 'get'
  match '/contact', to: 'static_pages#_contact', via: 'get'
  get "users/new"
  get "users/edit"
  get "events/edit"
  get "users/index"
  get 'admin' => 'admin#dashboard', as: :admin

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
