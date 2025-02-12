## How In Russian 概要

ロシア語を学習する方々が、「これってロシア語でなんて言うんだろう？」という疑問を解決するためのQ&Aサイトです。

質問に対する回答者は、同じロシア語学習者 or ロシア語教師を想定しており、それぞれの回答と一緒に回答者のウェブサイト情報が表示されます。それによって回答者は知名度を獲得でき、回答へのインセンティブとなることでサービスとして成り立たせることを考えています。

以下のテスト用アカウントでログインして使っていただけますと幸いです。:bow:

```md
メールアドレス： batur@test.com
パスワード： password
```

サイトURL： https://www.how-in-russian.com/


## 企画／要件定義／設計ドキュメント

このポートフォリオの企画〜設計、工程管理のドキュメントです。

ドキュメントURL： https://docs.google.com/spreadsheets/d/1Eu2xJ-XoyYVwxPHISGJcf9PbZtuWxxbfeerF2281wj4/edit?usp=sharing


## 動作環境

* Ruby 2.7.1
* Ruby on Rails 6.0.3
* PostgreSQL 13.2
* HEROKU (Hobby Dynos)


## 主な機能

* ユーザー管理／ログイン（devise）
* プロフィール画像アップロード（Amazon S3, carrierwave）
* 質問の投稿／編集
* 回答の投稿／編集
* ステータス別の質問一覧
  * 回答が付いている質問一覧
  * ブックマーク済みの質問一覧
  * ログインユーザーが投稿した質問一覧
  * 回答が付いていない質問一覧
* 投稿された質問の検索
* 投稿のブックマーク（Ajax）
* ページネーション（kaminari）
* レスポンシブデザイン(Bootstrap4)
