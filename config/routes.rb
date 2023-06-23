# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  
  resources :assignments do
    resources :questions
  end
  resources :courses

  resources :contacts
  
  resources :lessons
  
  resources :profile
  
  resources :student_courses
  
  devise_for :users, controllers: { registrations: 'devise/registrations' }

  resources :home do
    collection do
      get 'about'
      get 'course'
    end
  end


  # get 'home/course'
  
  get 'home/course_lesson/:id', to: 'home#course_lesson', as: 'course_lesson'
  
  get 'home/lesson_video/:id', to: 'home#lesson_video', as: 'lesson_video'
  
  get 'enrollments/enroll/:id', to: 'enrollments#enroll', as: 'enroll'
  
  get 'enrollments/show'
end
