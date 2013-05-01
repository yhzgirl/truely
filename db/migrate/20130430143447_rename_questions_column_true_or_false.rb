class RenameQuestionsColumnTrueOrFalse < ActiveRecord::Migration
  def change
    rename_column :questions, :true_or_false, :fact_or_fiction
  end

end
