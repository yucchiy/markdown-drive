Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match '/logout', to: 'sessions#destroy', via: [:get, :post]

  namespace :api do
    scope :format => true, :constraints => { :format => 'json' } do
      resources :documents, only: [:index, :show]
      match '/documents/fetch', to: 'documents#fetch', via: [:get, :post]
    end
  end

end
