Rails.application.routes.draw do
  # 顧客用
# URL /customers/sign_in ...
devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin,skip:[:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

# 会員側のルーティング設定
  scope module: :public do
  root to: "homes#top"
  
  resources :games, only: [:index, :show]
  
  resources :users, only: [:show, :edit, :update]
  
  resources :reviews
  
  get "search" => "searches#search"
  end
  
   # 管理者側のルーティング設定
  namespace :admin do
  root to: "homes#top"

  resources :games

  resources :genres, only: [:index, :create, :edit, :update, :destroy]

  resources :devices, only: [:index, :create, :edit, :update, :destroy]
  
  resources :users, only: [:index, :show,]

  resources :order_details, only: [:update]

  end
  
end
