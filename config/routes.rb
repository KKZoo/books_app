# frozen_string_literal: true

Rails.application.routes.draw do
  root "books#index"
  get "/new", to: "books#new"
  resources :books
end
