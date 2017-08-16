class QuestionsController < ApplicationController
  def index
    @questions = Question.where(private: false)
    respond_to do |format|
      format.json { render json: @questions }
    end
  end
end
