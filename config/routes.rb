Rails.application.routes.draw do
  # get 'static_pages/index'

  resources :custom_fields, only: [:index]
  
  resources :projects, only: [:show, :update]

  resources :media_inquiries, only: [:index, :show, :create]

  root 'static_pages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
