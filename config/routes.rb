# frozen_string_literal: true

Rails.application.routes.draw do
  resources :notes
  devise_for :users
  resources :items
  resources :meetings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'meetings#index'
end
