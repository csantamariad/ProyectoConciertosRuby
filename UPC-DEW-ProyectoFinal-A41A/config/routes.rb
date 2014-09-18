Ising::Application.routes.draw do


  resources :concert_users


  match "/auth/:provider/callback" => "sessions#create"

  match "/ajax/:concertid/comments/" => "comments#add_comment", :via => :post
  match "/ajax/comments/" => "comments#add_comment", :via => :post
  match "/ajax/comments/" => "comments#get_comments", :via => :get

  resources :comments 

  resources :picture_file do
    member do
      post "upload_file"
    end
  end

  resources :concerts


  resources :locals


  resources :group_users

  resources :groups 

  resources :users 

  resources :user_types


  root :to => 'welcome#index'



  resources :type_people
  resources :welcome

  match "/signout" => "sessions#destroy", :as => :signout

  match "public/groups" => "welcome#groups"
  match "public/concerts" => "welcome#concerts"
  match "public/locals" => "welcome#locals"
  match "public/aboutus" => "welcome#aboutus"
  match "public/enter" => "users#register_user"
  match "public/login" => "users#login", :via => :post
  match "public/logout" => "users#logout", :via => :get

  #Procesos del Usuario ----------------------------------------

  match "/password" => "users#password", :via => :get , :as => :password_root
  match "/password_change" => "users#password_change" , :via => :post , :as => :password_change

  match "/alumno" => "users#alumno", :via => :get , :as => :alumno_root
  match "/alumno_change" => "users#alumno_change" , :via => :post , :as => :alumno_change

  match "/email" => "users#email", :via => :get , :as => :email_root
  match "/email_change" => "users#email_change" , :via => :post , :as => :email_change

  match "/setting" => "users#setting", :via => :get , :as => :setting
  match "/setting_edit" => "users#setting_edit" , :via => :post , :as => :setting_edit

  # FIN Procesos del Usuario ----------------------------------------


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
  # match ':controller(/:action(/:id))(.:format)'
end
