Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :subs, except: [:destroy] 
  resources :posts, only: [:new, :create, :edit, :show] do
    resources :comments, only: [:new]
  end
  resources :comments, only: [:create]

  
end