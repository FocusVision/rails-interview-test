collection @questions
attributes :id, :title
child :answers do
  attributes :id,:body
end