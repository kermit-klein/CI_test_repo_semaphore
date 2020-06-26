# frozen_string_literal: true

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  namespace :api do
    resources :articles, only: %i[index show]
    resources :comments, only: %i[index create]
  end
end
