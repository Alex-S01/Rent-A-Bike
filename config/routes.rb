Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :bikes do
    resources :bookings, only:[:index, :show, :new, :create, :edit, :update]
  end
  resources :users, only: [:index, :new, :create, :show]
  resources :bookings, only: [:index]
end
