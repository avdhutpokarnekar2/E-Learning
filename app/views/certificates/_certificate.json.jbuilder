# frozen_string_literal: true

json.extract! certificate, :id, :grade, :user_id, :course_id, :created_at, :updated_at
json.url certificate_url(certificate, format: :json)
