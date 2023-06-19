# frozen_string_literal: true

Rails.application.routes.draw do
  resources :courses
  resources :contacts
  resources :profile
  resources :lessons
  resources :users
  devise_for :users, controllers: { registrations: 'devise/registrations' }


  root 'home#index'
  get 'home/about'    
  get 'home/course'    #user/index
  get 'home/course_lesson/:id',to: 'home#course_lesson', as: 'course_lesson'   #user/course_lesson
  get 'home/lesson_video/:id',to: 'home#lesson_video', as: 'lesson_video'    #user/lesson_video
  get 'enrollments/enroll/:id', to: 'enrollments#enroll', as: 'enroll'   #user/enroll
  get 'enrollments/show'      #user/show
  get 'profile/user_courses'  #user/courses
  get 'users/courses'
end
