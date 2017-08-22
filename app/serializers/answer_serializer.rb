class AnswerSerializer < ActiveModel::Serializer
  attributes :id
  attribute :body
  attribute :answerer

  def answerer
    {id: object.user.id, name: object.user.name}
  end
end
