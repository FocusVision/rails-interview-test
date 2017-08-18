class Question < ActiveRecord::Base

  has_many :answers
  belongs_to :user, inverse_of: :questions

  def self.all_by_query_params(params)
    questions = where(private: false)
    if params[:question_name]
      questions = questions.where('title LIKE ?', "%#{params[:question_name]}%")
    elsif params[:answer_name]
      questions = questions.joins(:answers).where('answers.body LIKE ?', "%#{params[:answer_name]}%")
    else
      questions
    end
  end

end
