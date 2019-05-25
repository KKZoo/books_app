# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  root "books#index"
  get "/new", to: "books#new"
  resources :books

  devise_scope :user do
    get "users/sign_out" => "devise/sessions#destroy"
  end
end
