Rails.application.routes.draw do
  devise_for :users
  root to:  'items#index'
  resources :items, only:[:edit, :update, :show, :new, :create, :destroy]  
  # destoryアクションまでのルーティングを作る
  # Controllerでdestroyアクションを定義する
  # ルーティングを見ながら、link_to(削除ボタン)にdestroyアクションを動かすためのpathを設定してあげる
end
