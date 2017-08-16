class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :api_authentication

  protected
  def render_api_unauthorized
    render json: "Invalid access token", status: :unauthorized
  end

  def api_authentication
    verify_api_access_token || render_api_unauthorized
  end

  def verify_api_access_token
    authenticate_with_http_token do |access_token, options|
      @tenant = Tenant.find_by(api_key: access_token)
    end
  end
end
