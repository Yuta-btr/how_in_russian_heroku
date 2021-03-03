class Bookmark < ApplicationRecord

  belongs_to :user
  belongs_to :question

  # 同じ質問のブックマークは、ユーザーごとに１回まで
  validates :user_id, presence: true, uniqueness: { scope: :question_id }

end
