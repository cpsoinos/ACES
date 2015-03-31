Rails.application.routes.draw do
  devise_for :users
  root 'restaurants#index'
  resources :restaurants do
    resources :reviews , only: [:show, :create, :destroy, :edit , :new, :update]
  end
end
