Rails.application.routes.draw do
  # ルートURLを設定
  root 'items#index'

  get 'items', to: 'items#index'
  
  # リソースとアクションの指定
  resources :items, only: [:index, :new, :create, :show, :destroy, :edit, :update] do
    get :edit_item, on: :member
  end
  
  # 商品情報の編集画面へのルーティングを設定
  # get 'items/:id/edit', to: 'items#edit', as: 'edit_item'

  # 商品情報の更新アクション
  patch 'items/:id', to: 'items#update'
  
  # Deviseの設定
  devise_for :users
end
