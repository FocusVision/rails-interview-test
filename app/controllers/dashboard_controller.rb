class DashboardController < ApplicationController
  def index
    @users = User.all
    @questions = Question.all
    @answers = Answer.all
    @tenants = Tenant.all
  end
end
