class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :statement
      t.boolean :true_or_false

      t.timestamps
    end
  end
end
