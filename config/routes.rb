Rails.application.routes.draw do
  resources :talk_tables
  root 'talk_tables#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
