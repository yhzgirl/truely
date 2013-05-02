class Response < ActiveRecord::Base
  
  attr_accessible :correct, :question_id, :user_id, :user_response

  belongs_to :user
  belongs_to :question

  # validates :user_response, presence: true

  def is_correct?
    user_response == Question.find(question_id).fact_or_fiction
  end
end
