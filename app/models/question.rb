class Question < ActiveRecord::Base
  attr_accessible :statement, :true_or_false

  has_many :responses
  has_many :users, through: :responses  

  before_validation :downcase_statement 

  validates :statement, presence: true
  validates :statement, length: { minimum: 5, maximum: 255 }
  validates :statement, uniqueness: { case_sensitive: true }
  
  self.per_page = 15

  private

    def downcase_statement
      self.statement = statement.downcase
    end
end
