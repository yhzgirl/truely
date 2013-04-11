class Response < ActiveRecord::Base
  attr_accessible :correct, :question_id, :user_id
end
