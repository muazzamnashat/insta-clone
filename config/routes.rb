Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: "registrations", omniauth_callbacks: "callbacks" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "public#homepage"
  # match "/auth/github/callback", to: "registrations#create", via: [:get, :post]
  get "/profile/:username", to: "users#profile", as: :profile
  get "/post/like/:post_id", to: "likes#save_like", as: :like_post
  post "/follow/account", to: "users#follow_account", as: :follow_account
  resources :posts
end
