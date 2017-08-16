class WelcomeController < ApplicationController
  skip_before_filter :api_authentication
  def index
    
  end
end
