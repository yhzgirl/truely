module ResponsesHelper
  def question_response_right_or_wrong
    @response.correct == true ? "right" : "wrong"
  end
end
