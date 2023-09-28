Rails.application.routes.draw do
  # ルートURLを設定
  root 'items#index'
  resources :items, only: [:index, :new, :create]

  # Deviseの設定
  devise_for :users
end
