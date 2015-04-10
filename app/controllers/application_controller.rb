class ApplicationController < ActionController::Base
  before_filter :devise_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def not_found
    raise ActionController::RoutingError.new("Not Found")
  end

  protected

  def devise_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(
        :username, :email, :password, :name,
        :password_confirmation, :avatar, :avatar_cache
      )
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(
        :username, :email, :password, :name,
        :password_confirmation, :current_password,
        :avatar, :avatar_cache, :remove_avatar
      )
    end
  end
end
