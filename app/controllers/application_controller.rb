class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  load_and_authorize_resource :cart
  load_and_authorize_resource :catalog
  load_and_authorize_resource :order
  load_and_authorize_resource :product
  load_and_authorize_resource :reciever
  load_and_authorize_resource :line_item
  load_and_authorize_resource :picture

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:username, :agreement, :email, :password)
    end

    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:username, :email, :password, :current_password, :admin, :avatar )
    end
  end
end
