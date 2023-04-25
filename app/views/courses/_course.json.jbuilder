# frozen_string_literal: true

json.extract! course, :id, :name, :description, :fees, :course_type, :duration, :start_date, :created_at, :updated_at
json.url course_url(course, format: :json)
