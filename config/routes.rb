Rails.application.routes.draw do

  match 'auth/:provider/callback', to: 'sessions#create', via: :get
  match 'sign_out', to: 'sessions#destroy', via: :delete

  match 'users/:id', to: 'users#show', via: :get, as: :user

  root 'welcome#index'
end
