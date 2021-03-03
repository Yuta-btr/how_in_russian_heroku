class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :profile_img, ProfileImgUploader

  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  # bookmarksテーブル経由でquestionsテーブルにアクセルできるようにする
  has_many :bookmark_questions, through: :bookmarks, source: :question

end
