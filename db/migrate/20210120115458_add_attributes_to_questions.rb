class AddAttributesToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :question, :text
    add_column :questions, :explanation, :text
    add_reference :questions, :user, null: false, foreign_key: true, index: true
  end
end
