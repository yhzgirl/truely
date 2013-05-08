class QuestionFactory

  def self.question(params = {})
    params[:statement] ||= "In 1980 Sir Winston Churhill died at his summer home in Chatsworth, London - " + rand(50000).to_s
    params[:fact_or_fiction] ||= "true"
    params[:user_id] ||= '1'
    Question.create!(params)
  end

  def self.questions(params = {}, n=5)
    n.times do |i|
      question = Question.new(params)
      question[:statement] = "Statement #{i + 1}"
      question[:fact_or_fiction] = "false"
      question[:user_id] = '1'
      question.save!
    end
  end

end