# frozen_string_literal: true

json.extract! question, :id, :title, :answer, :option, :assignment_id, :created_at, :updated_at
json.url question_url(question, format: :json)
