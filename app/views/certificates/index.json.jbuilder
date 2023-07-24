# frozen_string_literal: true

json.array! @certificates, partial: 'certificates/certificate', as: :certificate
