class User < ActiveRecord::Base

  has_many :questions, inverse_of: :user
  has_many :answers, inverse_of: :user

end
