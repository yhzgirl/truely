require 'test_helper'
require 'factories/question_factory'


class QuestionTest < ActiveSupport::TestCase

  test "should return a question to user" do
    question = QuestionFactory.question
    assert_equal 1, Question.count
  end
end