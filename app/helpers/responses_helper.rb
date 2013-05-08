module ResponsesHelper
  def question_response_right_or_wrong
    @response.correct == true ? "right" : "wrong"
  end

  def response_statistics
    Response.percentage_correctly_answered(current_user)
  end

  def answered_statistics
    Response.percentage_available_questions_answered(current_user)
  end
end
