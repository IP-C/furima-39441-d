Rails.application.routes.draw do
  # ルートURLを設定
  root 'items#index'

  get 'items', to: 'items#index'
  
  # リソースとアクションの指定
  resources :items, only: [:index, :new, :create, :show, :update, :destroy, :edit]

  # get 'purchases/new', to: 'purchases#new', as: 'new_purchase'
  
  # 商品情報の更新アクション
  put 'items/:id', to: 'items#update'
  
  # Deviseの設定
  devise_for :users
end