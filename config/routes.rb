Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: "registrations", omniauth_callbacks: "callbacks" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "sessions#index"
  match "/auth/github/callback", to: "sessions#create", via: [:get, :post]
end
