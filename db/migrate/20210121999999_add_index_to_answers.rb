class AddIndexToAnswers < ActiveRecord::Migration[6.0]
  # def change
  #   add_column :answers, :answer, :text
  #   add_column :answers, :explanation, :text
  #   add_reference :answers, :user, null: false, foreign_key: true, index: true
  #   add_reference :answers, :question, null: false, foreign_key: true, index: true
  # end
  def change
    add_index :answers, [:user_id, :question_id], unique: true
  end
end
