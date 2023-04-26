# frozen_string_literal: true

Rails.application.routes.draw do
  resources :courses
  devise_for :users

  root 'home#index'
  get 'home/show'
  get 'home/cours'
end
