# frozen_string_literal: true

Rails.application.routes.draw do
 
  devise_for :users, controllers: { registrations: 'devise/registrations' }

  ActiveAdmin.routes(self)

 
  root 'home#index'

  resources :certificates
  
  resources :assessments

  resources :assignments do
    resources :questions
  end

  resources :courses do
    resources :lessons
  end

  resources :contacts

  resources :profile

  resources :student_courses


  resources :home do
    collection do
      get 'about'
      get 'course'
    end
  end

  # get 'home/course_lesson/:id', to: 'home#course_lesson', as: 'course_lesson'

  get 'home/lesson_video/:id', to: 'home#lesson_video', as: 'lesson_video'

  get 'enrollments/enroll/:id', to: 'enrollments#enroll', as: 'enroll'

  get 'enrollments/show'

  get 'certificates/:id/generate_pdf', to: 'certificates#generate_certificate', as: 'generate_certificate_pdf'

end
