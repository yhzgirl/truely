class Question < ActiveRecord::Base
  attr_accessible :statement, :fact_or_fiction, :user_id

  has_many :responses
  has_many :users, through: :responses
  belongs_to :user 

  before_validation :downcase_statement 

  validates :statement, presence: true
  validates :statement, length: { minimum: 5, maximum: 255 }
  validates :statement, uniqueness: { case_sensitive: true }

  # Used by will_paginate to set no. users per page
  self.per_page = 15

  def self.random_question
    Question.first(order: 'RANDOM()')
  end

  private

    def downcase_statement
      self.statement = statement.downcase
    end
end
