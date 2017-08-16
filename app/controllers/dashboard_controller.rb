class DashboardController < ApplicationController
  skip_before_filter :api_authentication
  def index
    @users = User.includes(:questions, :answers)
    @tenants = Tenant.all
  end
end
