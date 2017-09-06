class FilterHttpRequest
  def initialize app
    @app = app
  end

  def call env
  	login_limit_flag = false
  	request = Rack::Request.new(env)
  	api_key = ApiKey.where(:api_key =>  request.params['api_key']).first
  	if api_key
  		if Date.parse("#{api_key.updated_at}") == Time.now.utc.to_date
  			if api_key.per_day_request_count > 100
  				if (Time.now.to_f - api_key.updated_at.to_f) < 10
  					login_limit_flag = true
  				end
  			end
  		end
  	end
    api_key.per_day_request_count = api_key.per_day_request_count + 1
    api_key.save
  	if login_limit_flag
      [200, { 'Content-Type' => 'application/json' }, [ {:message => 'MaxiMum API Limit Reached'}.to_json ]]
    else
  	   @status, @headers, @response = @app.call(env)
  	end
  end
end