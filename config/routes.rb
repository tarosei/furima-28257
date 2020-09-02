Rails.application.routes.draw do
  devise_for :users
  root to:  'items#index'
  resources :items, only:[:edit, :show, :new,]
  
end
