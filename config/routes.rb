Rails.application.routes.draw do
  devise_for :users
  root "restaurants#index"

  resources :restaurants, only: [
    :index, :show, :new, :edit,
    :create, :update, :destroy
  ] do
    resources :reviews, only: [:show, :create, :destroy, :edit, :new, :update]
  end
end
