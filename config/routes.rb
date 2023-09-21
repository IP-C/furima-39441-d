Rails.application.routes.draw do
  # ルートURLを設定
  root 'items#index'

  # ユーザーの詳細情報ページへのルーティングを追加
  resources :users, only: [:new] 

  # Deviseの設定
  devise_for :users
end
