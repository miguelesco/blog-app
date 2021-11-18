class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  include Response
  include ExceptionHandler
  

  respond_to :json
  protect_from_forgery with: :null_session

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user
  before_action :underscore_params!


  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :bio, :photo, :password) }

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :bio, :photo, :password, :current_password)
    end
  end

  def authenticate_user
    if request.headers['Authorization'].present?
      authenticate_or_request_with_http_token do |token|
        p token
        begin
          jwt_payload = JWT.decode(token, Rails.application.secrets.secret_key_base).first
          p token
          @current_user_id = jwt_payload['id']
        rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
          p token
          head :unauthorized
        end
      end
    end
  end

  private 
  def authenticate_user!(options = {})
    head :unauthorized unless signed_in?
  end

  def current_user
    @current_user ||= super || User.find(@current_user_id)
  end

  def signed_in?
    @current_user_id.present?
  end
end
