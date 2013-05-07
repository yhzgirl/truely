require 'test_helper'
require 'factories/question_factory'
require 'factories/response_factory'

class ResponseTest < ActiveSupport::TestCase

  test "correct if user response matches question's set fact or fiction value" do
    user_response = ResponseFactory.correct_response
    assert_equal true, user_response.is_correct?
  end

  test 'can determine number of statements user has answered' do    
    user = User.create!(name: 'bob')
    response = ResponseFactory.correct_response(:user_id => user.id)
    response2 = ResponseFactory.correct_response(:user_id => user.id)
    assert_equal 2, Response.count  
    user_has_answered = Response.num_questions_answered(user)
    assert_equal 2, user_has_answered
  end

end