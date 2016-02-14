Museo::Application.routes.draw do
  
  resources :contacts

  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "sign_up" => "users#new", :as => "sign_up"
  root :to => "home#index"
  
  resources :users
  resources :sessions
  resources :galleries do
    resources :images
  end
  resources :images
  resources :posts
  resources :pages, only: [:new, :create]

  get 'contact' => 'contact#new'
  post 'contact' => 'contact#create'

  #keep these at the bottom of your file. They should be the last routes.
  get "/:slug", to: "pages#show", as: :slug
  get "/:slug/edit", to: "pages#edit", as: :edit_slug
  patch "/:slug", to: "pages#update", as: :update_slug
  delete "/:slug", to: "pages#destroy", as: :delete_slug
end
