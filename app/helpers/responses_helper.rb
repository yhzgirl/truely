module ResponsesHelper
  def question_response_right_or_wrong
    @response.correct == true ? "right" : "wrong"
  end

  def response_statistics
    @user_stat = Response.percentage_correctly_answered(current_user)
    @user_stat.nan? ? "0" : sprintf('%.0f', @user_stat)
  end

  def answered_statistics
    @user_answered_stat = Response.percentage_available_questions_answered(current_user)
    @user_answered_stat.nan? ? "0" : sprintf('%.0f', @user_answered_stat)
  end
end
