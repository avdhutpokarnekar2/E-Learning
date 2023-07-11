# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'devise/registrations' }
  # Devise routes for user authentication with custom registrations controller

  ActiveAdmin.routes(self)
  # ActiveAdmin routes for the admin panel

  root 'home#index'
  # Root route for the home#index action

  resources :certificates
  # RESTful routes for the certificates resource

  resources :assessments
  # RESTful routes for the assessments resource

  resources :assignments do
    resources :questions
    # Nested RESTful routes for questions under assignments
  end

  resources :courses do
    resources :lessons
    # Nested RESTful routes for lessons under courses
  end

  resources :contacts
  # RESTful routes for the contacts resource

  resources :profile
  # RESTful routes for the profile resource

  resources :student_courses
  # RESTful routes for the student_courses resource

  resources :home do
    collection do
      get 'about'
      get 'course'
    end
  end
  # RESTful routes for the home resource with additional custom routes 'about' and 'course'

  get 'home/lesson_video/:id', to: 'home#lesson_video', as: 'lesson_video'
  # Custom route to display lesson video for a specific lesson

  get 'enrollments/enroll/:id', to: 'enrollments#enroll', as: 'enroll'
  # Custom route to enroll in a course with a specific ID

  get 'enrollments/show'
  # Route to show enrollments

  get 'certificates/:id/generate_pdf', to: 'certificates#generate_certificate', as: 'generate_certificate_pdf'
  # Custom route to generate a PDF for a specific certificate

  get 'payment/stripe_payment'
  # Route for the stripe_payment action in the payment controller

  get 'payment/success'
  # Route for the success action in the payment controller

  get 'payment/cancel'
  # Route for the cancel action in the payment controller
end
