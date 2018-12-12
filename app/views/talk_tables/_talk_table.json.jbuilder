# frozen_string_literal: true

json.extract! talk_table, :id, :input, :message, :tag, :created_at, :updated_at
json.url talk_table_url(talk_table, format: :json)
