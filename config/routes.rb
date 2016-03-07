Rails.application.routes.draw do
  resources :searches

  root 'static_pages#home'
  get 'index' => 'books#index'
  get 'new' => 'books#new'
  get 'edit' => 'books#edit'
  get 'browse_index' => 'books#browse_index'
  get 'browse_genre' => 'books#browse_genre'
  get 'browse_tags' => 'books#browse_tags'
  get 'browse_reviews' => 'reviews#browse_reviews'
  get 'browse_ratings' => 'books#browse_ratings'
  get 'browse_selected_genre' => 'books#browse_selected_genre'
  get 'new_review' => 'reviews#new'
  get 'tags/:tag', to: 'books#books_index', as: :tag
  Rails.application.routes.draw do
  resources :searches

  post '/rate' => 'rater#create', :as => 'rate'
  	resources :books do
  		resources :reviews
  		get :tag
  	end
  end
  
  
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
