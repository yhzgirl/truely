class Question < ActiveRecord::Base
  attr_accessible :statement, :fact_or_fiction, :user_id

  has_many :responses
  has_many :users, through: :responses
  belongs_to :user 

  before_validation :downcase_statement 

  validates :statement, presence: true
  validates :statement, length: { minimum: 5, maximum: 255 }
  validates :statement, uniqueness: { case_sensitive: true }
  validates :fact_or_fiction, presence: true

  # Used by will_paginate to set no. users per page
  self.per_page = 15

  def self.random_question
    Question.first(order: 'RANDOM()')
  end

  # # def self.random_question
  # #   # Question.first(order: 'RANDOM()')
  # #   askable_questions = get_current_users_outstanding_questions
  # #   # askable_questions.first(order: 'RANDOM()')
  # # end

  # def self.get_random_outstanding_question_for_current_user
  #   self.find_by_sql("SELECT * FROM questions WHERE id NOT IN (SELECT question_id FROM responses WHERE user_id = 1) ORDER BY RANDOM() LIMIT 1;")#.first(order: 'RANDOM()')
  # end

  private

    def downcase_statement
      self.statement = statement.downcase
    end
end
