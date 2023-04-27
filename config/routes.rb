# frozen_string_literal: true

Rails.application.routes.draw do
  resources :courses
  resources :contacts
  resources :profile
  devise_for :users

  root 'home#index'
  get 'home/show'
  get 'home/course'
  get 'home/contact'
end
