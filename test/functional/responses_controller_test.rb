require 'test_helper'

class ResponsesControllerTest < ActionController::TestCase

  test "should save on Post" do
    assert_equal 0, Response.count
    user = User.create!(name: 'bob')
    question = Question.create!(statement: 'Tower Bridge is the oldest in London', fact_or_fiction: 'fact')

    post :create, {response: {question_id: question.id}}, {user_id: user.id}
    assert_equal 1, Response.count
    assert_response 302, @response.body
  end
end