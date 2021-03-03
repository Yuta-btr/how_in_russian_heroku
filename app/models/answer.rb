class Answer < ApplicationRecord

  belongs_to :user
  belongs_to :question

  validates :answer, presence: true, length: { maximum: 100 }
  validates :explanation, length: { maximum: 250 }
  # 同じ質問への回答は、ユーザーごとに１回まで
  validates :user_id, presence: true, uniqueness: { scope: :question_id }

end
