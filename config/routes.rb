require 'sidekiq/web'

Rails.application.routes.draw do

  mount Sidekiq::Web => '/sidekiq'

  namespace :dashboard do
  get 'archive' => 'archive#index'
  end

  namespace :dashboard do
  get 'integrations' =>'integrations#index'
  end

  namespace :admin do
  get 'bing_search/index'
  post 'bing_search/create'
  get 'bing_search/searches'
  get 'bing_search/results/:admin_search_id', to: 'bing_search#results'
  end

  namespace :dashboard do
  get 'search/index'
  end



  namespace :admin do
  get 'article_search/index'
  get 'article_search/results/:admin_search_id', to: 'article_search#results'
  get 'article_search/searches'
  post 'article_search/create'
  get 'article_search/custom_search'
  end

  namespace :dashboard do
    root to: 'home#index'
    get 'setup/keywords'
    get 'setup/processing'
    post 'setup/create_keywords'
    get 'keywords/index'
    get 'home/index'
    post 'home/edit_keyword'
    post 'home/delete_article'
    post 'home/search_status'
  end

  root 'home#index'
  #devise_for :users
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # Omniauth
  # Sample reference: https://github.com/RailsApps/rails-omniauth/
  get '/auth/:provider/callback', to: 'sessions#create', as: 'callback'
  get '/auth/failure', to: 'sessions#error', as: 'failure'

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
