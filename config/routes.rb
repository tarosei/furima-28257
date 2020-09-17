Rails.application.routes.draw do
  devise_for :users
  root to:  'items#index'
  resources :items, only:[:edit, :update, :show, :new, :create, :destroy]
end
