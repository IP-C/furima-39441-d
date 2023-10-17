Rails.application.routes.draw do
  # ルートURLを設定
  root 'items#index'

  get 'items', to: 'items#index'
  
  # リソースとアクションの指定
  resources :items, only: [:index, :new, :create, :show]

  # Deviseの設定
  devise_for :users
end


