Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  resources :documents, only: [:show]
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match '/logout', to: 'sessions#destroy', via: [:get, :post]

  namespace :api do
    scope :format => true, :constraints => { :format => 'json' } do
      match '/documents/fetch', to: 'documents#fetch', via: [:get, :post]
      resources :documents, only: [:index, :show]
    end
  end

end
