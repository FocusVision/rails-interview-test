class ApiController < ActionController::Base
  # For APIs, using :null_session.
  protect_from_forgery with: :null_session
  
  before_filter :api_authentication
  
  protected
  # Render status 401 for Invalid access token
  def render_api_unauthorized
    render json: 'Invalid access token', status: :unauthorized
  end

  # Allow all api requests to have valid access token for authentication
  def api_authentication
    verify_api_access_token || render_api_unauthorized
  end

  # Verify the http access token to matches with the valid tenant api key
  def verify_api_access_token
    authenticate_with_http_token do |access_token, options|
      tenant = Tenant.find_by(api_key: access_token)
      if tenant
        tenant_api_request = tenant.tenant_api_requests.find_or_create_by(track_date: Date.today)
        tenant_api_request.update_attributes(count: tenant_api_request.count + 1)
      end
    end
  end
end