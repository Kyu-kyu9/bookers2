Rails.application.routes.draw do
    
  
  devise_for :users
  
  resources :books
  resources :users #only:[:new,:show,:index,:destroy,:update,:edit]
  resource :homes, only:[:about,:top]
  get "/home/about" => "homes#about", as: "about"
  root to: "homes#top"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
