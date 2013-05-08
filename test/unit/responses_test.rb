require 'test_helper'
require 'factories/question_factory'
require 'factories/response_factory'

class ResponseTest < ActiveSupport::TestCase

  def setup
    @user = User.create!(name: 'bob')
    response = ResponseFactory.correct_response(:user_id => @user.id)
    response2 = ResponseFactory.correct_response(:user_id => @user.id)
    response3 = ResponseFactory.incorrect_response(:user_id => @user.id)
    response4 = ResponseFactory.incorrect_response(:user_id => @user.id)
  end

  test "correct if user response matches question's set fact or fiction value" do
    user_response = ResponseFactory.correct_response
    assert_equal true, user_response.is_correct?
  end

  test 'can determine number of statements user has answered' do    
    assert_equal 4, Response.count  
    user_has_answered = Response.num_questions_answered(@user)
    assert_equal 4, user_has_answered
  end

  test 'can determine number of responses which are correct' do
    correctly_answered = Response.num_correctly_answered(@user)
    assert_equal 2, correctly_answered
  end

  test 'calculate percentage of correctly answered questions' do
    percentage_correctly_answered = Response.percentage_correctly_answered(@user)
    assert_equal "50", percentage_correctly_answered   
  end

  test 'calculate percentage of correctly answered questions when 0 answered' do
    fred = User.create!(name: 'fred')
    percentage_correctly_answered = Response.percentage_correctly_answered(fred)
    assert_equal "0", percentage_correctly_answered
  end

  test 'calculate percentage of available questions answered' do
    questions = QuestionFactory.questions(nil, 4)
    percent_answered = Response.percentage_available_questions_answered(@user)
    assert_equal "50", percent_answered
  end

  test 'calculate percentage of unanswered questions when 0 answered' do
    fred = User.create!(name: 'fred')
    percent_answered = Response.percentage_available_questions_answered(fred)
    assert_equal "0", percent_answered
  end
end