DotVoting::Application.routes.draw do

  devise_scope :user do
    get "sign_in", to: "devise/sessions#new"
  end

  #get 'suggestions/save_answer', to: 'suggestions#save_answer'
  # match "suggestions/save_answer" => "suggestions#save_answer", via: [:get, :post]

  # get 'round/status', to: 'round#status'
  devise_for :users
  resources :users
  resources :rounds do
    post :status, on: :member
    resources :comments
    post :add_more_answer, on: :member
  end
  resources :votes do
    post :question, on: :member
  end
  resources :suggestions do
    post :status, on: :member
    post :save_voting, on: :collection
  end
  root to: "rounds#index"

  resources :answers do
    post :store_answers, on: :collection
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root :'user#index'

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