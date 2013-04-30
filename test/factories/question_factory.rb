class QuestionFactory

  def self.question(params = {})
    params[:statement] ||= "In 1980 Sir Winston Churhill died at his summer home in Chatsworth, London"
    params[:fact_or_fiction] ||= "true"
    Question.create!(params)
  end

end