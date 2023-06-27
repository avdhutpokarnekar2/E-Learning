# frozen_string_literal: true

json.array! @assessments, partial: 'assessments/assessment', as: :assessment
