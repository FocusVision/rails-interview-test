class User < ActiveRecord::Base

  has_many :questions, inverse_of: :asker
  has_many :answers,   inverse_of: :answerer
  has_one :api_key
end
