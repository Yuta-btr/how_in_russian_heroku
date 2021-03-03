class Question < ApplicationRecord

  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :bookmarks, dependent: :destroy


  def bookmark_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end

end
