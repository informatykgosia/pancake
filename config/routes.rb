Projekt::Application.routes.draw do


  get "static_pages/home"

  # get "drpancakes/destroy"

  # get "drpancakes/edit"

  # get "drpancakes/show"

  # get "drpancakes/index"

  # get "drpancakes/new"

  # get "drpancakes/create"

 # get "user_sessions/new"

  #get "user_sessions/create"

 # get "user_sessions/destroy"


  resources :ingredients, :only => [:new, :create, :index, :show, :destroy]
  resources :drpancakes, :only => [:new, :create, :index, :show, :edit, :destroy]
  resources :users, :only => [:new, :create, :edit, :update]

  resource :user_session, :only => [:new, :create, :destroy]
  match "login" => "user_sessions#new"
  match "logout" => "user_sessions#destroy"
  match 'crew' => 'pages#crew' 
  root :to => "lokals#index"
  
 resources :pancakes, :has_many => :ingredients 
 resources :pancakes, do
  resources :ingredients
  resources :comments
 end 
  #resources :lokals
  #match "search" => "lokals#search"
  
  resources :lokals, :only => [:index, :new, :create, :show] do
     get 'search', :on => :collection
     resources :comments
   end
  resources :lokals, :has_many => :comments
  resources :pancakes, :has_many => :comments
  

  # krzyczy że nie ma ścieżki wtf
  #post "lokals/search"
  
 # match '/lokals/:id', :to => 'lokals#show'
 # match '/all_lokals', :to => 'users#index'

  #resources :search, :only => [:search]
  #root :to => "lokals#search"

  # get "users/new"

 # get "users/create"

 #get "users/edit"

 # get "users/update"

 # get "lokals/index"

  #get "lokals/new"

 # get "lokals/create"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
