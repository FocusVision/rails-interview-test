class QuestionsController < ApplicationController
	before_action :validate_api_key

	def validate_api_key
		api_key = ApiKey.where(:api_key => params[:api_key]).first
		if api_key
			api_key.request_count = api_key.request_count + 1
			api_key.save
		else
			render :json => {:message => "Invalid Key",:code => 401} , :status => 401
		end
	end

	def index
		@questions = Question.where("private =? and title like ?", false,"%#{params[:query]}%")
		render :json => {:message => "No Data Found",:code => 404} , :status => 404 if @questions.empty?
	end
end