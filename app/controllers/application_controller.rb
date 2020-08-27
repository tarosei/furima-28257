class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, :basic_auth, if: :devise_controller?
  

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name , :last_name, :first_name_kana, :last_name_kana, :birthday, :nick_name])
  end
  def show
    @user = current_user
  end
  def basic_auth
    authenticate_or_request_with_http_basic do |email, password|
      email == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"] 
    end
  end
end
