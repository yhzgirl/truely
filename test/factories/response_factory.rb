require 'factories/question_factory'

class ResponseFactory
  def self.correct_response(params={})
    question = QuestionFactory.question
    params[:question_id] = question.id
    params[:user_response] = true
    Response.create!(params)
  end

  def self.incorrect_response(params={})
    question = QuestionFactory.question
    params[:question_id] = question.id 
    params[:user_response] = false
    Response.create!(params)
  end
end