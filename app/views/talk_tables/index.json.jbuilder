# frozen_string_literal: true

json.array! @talk_tables, partial: 'talk_tables/talk_table', as: :talk_table
