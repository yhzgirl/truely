module ResponsesHelper
  def question_response_right_or_wrong
    @response.correct == true ? "right" : "wrong"
  end

  def response_statistics
    @user_stat = Response.percentage_correctly_answered(current_user)
    sprintf('%.0f', @user_stat)
  end

  
end
