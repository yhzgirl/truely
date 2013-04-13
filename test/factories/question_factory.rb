class QuestionFactory

  def self.question(params = {})
    params[:statement] ||= "In 1980 Sir Winston Churhill died at his summer home in Chatsworth, London"
    params[:true_or_false] ||= "true"
    Question.create!(params)
  end

end