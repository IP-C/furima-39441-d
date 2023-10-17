Rails.application.routes.draw do
  # ルートURLを設定
  root 'items#index'

  get 'items', to: 'items#index'
  
  # リソースとアクションの指定
  resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  # get 'purchases/new', to: 'purchases#new', as: 'new_purchase'

  # 商品情報の編集画面へのルーティングを設定
  get 'items/:id/edit', to: 'items#edit', as: 'edit_item'

  # Deviseの設定
  devise_for :users
end


