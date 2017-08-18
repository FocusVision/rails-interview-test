class DashboardController < ApplicationController
  skip_before_filter :api_authentication
  def index
    @users = User.all
    @questions = Question.all
    @answers = Answer.all
    @tenants = Tenant.all
  end
end
