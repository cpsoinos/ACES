Rails.application.routes.draw do
  devise_for :users
  root "homes#index"

  resources :users, only: [:index, :show, :destroy, :edit, :update]

  resources :restaurants, only: [
    :index, :show, :new, :edit,
    :create, :update, :destroy
  ] do
    resources :reviews, only: [:show, :create, :destroy, :edit, :new, :update]
  end

  resources :reviews, only: [:edit, :update] do
    resources :upvotes, only: [:new, :create, :edit, :update]
    resources :downvotes, only: [:new, :create, :edit, :update]
  end
end
