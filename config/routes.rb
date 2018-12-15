# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :talk_tables
  root 'talk_tables#index'
  mount LetterOpenerWeb::Engine, at: '/mail' if Rails.env.development?

  post '/callback' => 'linebot#callback'
  get '/talk_table_search_reset' => 'talk_tables#talk_table_search_reset'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
