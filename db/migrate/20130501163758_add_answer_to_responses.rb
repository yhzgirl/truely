class AddAnswerToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :user_response, :boolean
  end
end
