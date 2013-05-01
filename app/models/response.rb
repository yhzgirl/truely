class Response < ActiveRecord::Base
  attr_accessible :correct, :question_id, :user_id

  belongs_to :user
  belongs_to :question
  
end
