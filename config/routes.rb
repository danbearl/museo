Museo::Application.routes.draw do
  # get "posts/new"

  # get "posts/edit"

  # get "posts/show"

  # get "posts/index"

  # get "posts/destroy" 
  
  resources :contacts

  # get "galleries/new"

  # get "galleries/create"

  # get "galleries/update"

  # get "galleries/destroy"

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

  match 'contact' => 'contact#new', :as => 'contact', :via => :get
  match 'contact' => 'contact#create', :as => 'contact', :via => :post

  #keep these at the bottom of your file. They should be the last routes.
  get "/:slug", to: "pages#show", as: :slug
  get "/:slug/edit", to: "pages#edit", as: :edit_slug
  put "/:slug", to: "pages#update", as: :slug
  post "/:slug", to: "pages#destroy", as: :slug
end
