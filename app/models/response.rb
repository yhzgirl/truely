class Response < ActiveRecord::Base
  
  attr_accessible :correct, :question_id, :user_id, :user_response

  belongs_to :user
  belongs_to :question

  # validates :user_response, presence: true

  def is_correct?
    user_response == Question.find(question_id).fact_or_fiction
  end

  def self.num_questions_answered(user)
    Response.find_all_by_user_id(user).count
  end
end