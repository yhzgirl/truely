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

  def self.num_correctly_answered(user)
    Response.find_all_by_user_id_and_correct(user, true).count
  end

  def self.percentage_correctly_answered(user)
    # need to use .to_f on the denominator to get a non-zero value from the division
    ( num_correctly_answered(user) / num_questions_answered(user).to_f ) * 100 
  end

  def self.percentage_available_questions_answered(user)
    ( num_questions_answered(user) / Question.questions_available_for_user(user).to_f ) * 100 
  end
end