# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"


# テストユーザー
5.times do |n|
  img_num = n % 4 + 1
  User.create!(
    email: "batur#{n+1}@test.com",
    password: "password#{n+1}",
    name: Faker::Name.first_name,
    profile_img: open("./db/fixtures/test#{img_num}.png"),
    nationality: "日本",
    introduction: "No.#{n+1}のテストユーザーです。",
    website: "http://www.example.com/"
  )
end


# 質問者と回答者それぞれの配列
# question_users = User.order(:user_id).take(10)
question_users = User.order(:created_at).take(5)
# answer_users = User.order(user_id: "DESC").take(10)
answer_users = User.order(created_at: "DESC").take(5)
# CSVの列ごとに質問と回答を作成
CSV.foreach('./db/csv/phrases.csv',headers: true).with_index(1) do |row, ln|
  # make question
  ramdom_question_user = question_users.sample
  ramdom_question_user.questions.create(
    question: row['ja'],
    explanation: "#{ln}番目の質問です。"
  )

  # make answer
  ramdom_answer_user = answer_users.sample
  ramdom_answer_user.answers.create(
    answer: row['ru'],
    explanation: "#{ln}番目の回答です。",
    question_id: ln
  )
end


# テスト用のブックマーク情報
bookmark_users = User.order(:created_at).take(10)
bookmark_users.each_with_index do |user, index|
  (3..5).each do |n|
    user.bookmarks.create!(
      question_id: (index+n)
    )
  end
end



# # テスト用の質問
# users = User.order(:user_id).take(10)
# user_counter = 0
# users.each do |user|
#   user_counter += 1
#   user.questions.create!(
#     question: "#{user.name}さんのおすすめの中央アジア料理のお店はどこ？",
#     explanation: "#{user_counter}番目の質問です。"
#   )
#   if user.id <= 5
#     user_counter += 1
#     user.questions.create!(
#       question: "#{user.name}さんのおすすめのロシア料理のお店はどこ？",
#       explanation: "#{user_counter}番目の質問です。"
#     )
#   end
# end
#
# # テスト用の回答
# users = User.order(user_id: "DESC").take(10)
# question_counter = 0
# users.each do |user|
#     question_counter += 1
#     user.answers.create!(
#       answer: "#{question_counter} раз. Я рад, что редактирование прошло благополучно.",
#       explanation: Faker::Lorem.paragraph(sentence_count: 1, supplemental: true, random_sentences_to_add: 4),
#       question_id: question_counter
#     )
# end
#
