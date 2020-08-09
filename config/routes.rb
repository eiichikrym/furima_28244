Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:new, :create, :show, :destroy, :edit, :update] do
    resources :trades, only: [:index, :create]
    member do
       get "trades"
    end
  end
end