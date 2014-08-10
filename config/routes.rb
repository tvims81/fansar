Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  
  mount Ckeditor::Engine => '/ckeditor'

  resources :teachers, only: [:create, :destroy, :update, :show, :index] do
    member do
      get :registration_confirm
      get :reset_password
      post :update_password
    end
  end

  resources :students, only: [:create, :destroy, :update, :show, :index] do
    member do
      get :registration_confirm
      get :reset_password
      post :update_password
      post :subscribe_to_subject
    end
  end 
  
  resources :lectures, only: [:create, :destroy, :update, :show, :index] do
    resources :homeworks, only: [:create, :destroy, :update, :index] do
      member do
        post :rate
      end
    end
  end

  resources :notices, only: [:destroy] do
    member do
      post :read
    end
  end
  
  resource :teacher_session, only: [:create, :destroy] do
    post :forgot_password
  end

  resource :student_session, only: [:create, :destroy] do
    post :forgot_password
  end

  namespace :admin do
    resources :students, :teachers, :lectures, :notices
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
