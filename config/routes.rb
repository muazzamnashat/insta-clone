Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: "registrations", omniauth_callbacks: "callbacks" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "public#homepage"
  # match "/auth/github/callback", to: "registrations#create", via: [:get, :post]
  get "/users/:username", to: "users#profile", as: :profile
  get "/post/like/:post_id", to: "likes#save_like", as: :like_post
  post "/follow/account", to: "users#follow_account", as: :follow_account
  resources :users do
    resources :posts, only: [:show, :new, :edit]
  end
  resources :posts
  resources :comments, only: [:create, :destroy, :update]
end
