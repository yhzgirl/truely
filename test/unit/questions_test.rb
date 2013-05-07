require 'test_helper'
require 'factories/question_factory'


class QuestionTest < ActiveSupport::TestCase

  test "should return a question to user" do
    question = QuestionFactory.question
    assert_equal 1, Question.count
  end

  test 'can determine how many questions a user has available' do
    bob = User.create!(name: 'bob')
    sally = User.create!(name: 'sally')
    questions = QuestionFactory.questions
    questions_user_has_available = Question.questions_available_for_user(sally)
    assert_equal 5, questions_user_has_available
  end
  
end