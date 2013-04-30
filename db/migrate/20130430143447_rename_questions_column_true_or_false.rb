class RenameQuestionsColumnTrueOrFalse < ActiveRecord::Migration
  def change
    rename_column :questions, :fact_or_fiction, :fact_or_fiction
  end

end
