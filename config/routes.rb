Rails.application.routes.draw do
  devise_for :users
  resources :restaurants, only: [
    :index, :show:, :new, :edit,
    :create, :update, :destroy
    ]
  root "restaurants#index"
end
