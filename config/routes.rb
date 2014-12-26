Rails.application.routes.draw do

  match 'auth/:provider/callback', to: 'sessions#create', via: :get
  match 'sign_out', to: 'sessions#destroy', via: :delete

  match 'users/:id', to: 'users#show', via: :get, as: :user

  match 'settings/edit', to: 'settings#edit', via: :get, as: :edit_setting
  match 'settings', to: 'settings#update', via: [:put, :patch],  as: :update_setting

  match 'webhooks', to: 'webhooks#index', via: [:post], as: :webhooks

  root 'welcome#index'
end
