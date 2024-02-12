Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:index, :destroy, :create, :new, :show, :edit, :update]
end
