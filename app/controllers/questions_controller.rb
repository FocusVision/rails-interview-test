class QuestionsController < ApplicationController
  def index
    @questions = Question.all_by_query_params(params)
    respond_to do |format|
      format.json { render json: @questions }
    end
  end
end
