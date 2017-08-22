class QuestionSerializer < ActiveModel::Serializer
  attributes :id
  attribute :title

  has_many :answers
  has_one :user, key: :asker
end
