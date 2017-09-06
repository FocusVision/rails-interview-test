# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'ffaker'

# Tenants
10.times do
  Tenant.create(name: FFaker::Company.name)
end

# Users
users = []
20.times do
  users << User.create(name: FFaker::Name.name)
end

# Questions and Answers
20.times do
  question = Question.create(title: FFaker::HipsterIpsum.sentence.gsub(/\.$/, "?"),
    private: FFaker::Boolean.random, user: users.sample)
  (1 + rand(3)).times do
    question.answers.create(body: FFaker::HipsterIpsum.sentence, user: users.sample)
  end
end

users = User.all
users.each do |user|
	user = user.build_api_key(:api_key => "#{user.id}#{SecureRandom.hex(8)}")
	user.save
end
