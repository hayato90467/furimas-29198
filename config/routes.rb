Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root  'users#index' 
  root  'items#index'
  resources :items, only: [:index, :new, :show, :edit, :create, :destroy]
end
