Rails.application.routes.draw do
  # ルートURLを設定
  root 'items#index'

  # Deviseの設定
  devise_for :users

  resources :items, only: [:index]
end
