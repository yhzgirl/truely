require 'test_helper'
require 'factories/question_factory'
require 'factories/response_factory'

class ResponseTest < ActiveSupport::TestCase

  test "correct if user response matches question's set fact or fiction value" do
    user_response = ResponseFactory.correct_response
    assert_equal true, user_response.is_correct?
  end
  
end