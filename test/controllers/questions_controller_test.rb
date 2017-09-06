require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase

	test "should return successful response"  do
		get :index , :format => :json , :api_key => 'yyyyy'
		assert_response 200 , 'Test should return successful response'
	end

	test 'API with invalid key should not be able to access data' do
		get :index , :format => :json , :api_key => 'xxxxx'
		assert_response 401, 'Test should return 401 Authentication error'
	end

	test 'API with Valid key should be able to access data' do
		get :index , :format => :json , :api_key => 'yyyyy'
		assert_response 200, 'Test should return successful response'
	end

	test 'should return only private questions' do
		private_question_count = Question.where(:private => true).count
		get :index , :format => :json , :api_key => 'yyyyy'
		response = JSON.parse(@response.body)
		assert_equal response.count , private_question_count , 'should return only private questions'
	end
end