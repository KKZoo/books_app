# frozen_string_literal: true

Rails.application.routes.draw do
  root "books#index"
  get "/new", to: "books#new"
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
