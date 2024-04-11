Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :orders, only: [:index, :create] 
    resources :likes, only: [:create, :destroy, :index]
    resources :comments, only: [:create, :destroy]
  end

  resources :users do
    member do
      get :likes
    end
  end

end

