class AddAttributesToBookmarks < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookmarks, :user, null: false, foreign_key: true, index: true
    add_reference :bookmarks, :question, null: false, foreign_key: true, index: true
  end
  # add_index :bookmarks, [:user_id, :question_id], unique: true
end
