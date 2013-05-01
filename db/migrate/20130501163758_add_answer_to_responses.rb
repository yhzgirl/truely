class AddAnswerToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :value, :boolean
  end
end
