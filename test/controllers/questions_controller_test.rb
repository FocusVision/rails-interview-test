require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  test "should get with status 401 without Tenant API key" do
    get :index, format: :json
    assert_response 401
  end
end
