class Question < ActiveRecord::Base

  has_many :answers
  belongs_to :user, inverse_of: :questions

end
