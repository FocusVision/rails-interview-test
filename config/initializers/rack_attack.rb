class Rack::Attack
  # Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new 

  throttle('api/ip', limit: 1, period: 10.seconds) do |req|
    token = req.env['HTTP_AUTHORIZATION'].split('=').last if req.env['HTTP_AUTHORIZATION']
    tenant = Tenant.find_by(api_key: token)
    if tenant
      tenant_api_request = tenant.tenant_api_requests.find_by(track_date: Date.today)
      req.ip if tenant_api_request && tenant_api_request.count > 100
    end
  end
end