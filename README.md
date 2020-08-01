# furima-28244 テーブル設計

## users テーブル
| Column            | Type    | Options     |
| ----------------- | ------- | ----------- |
| nickname          | string  | null: false |
| email             | string  | null: false, unique:true |
| password          | string  | null: false |
| password_confirm  | string  | null: false |
| last_name         | string  | null: false |
| first_name        | string  | null: false |
| last_name_kana    | string  | null: false |
| first_name_kana   | string  | null: false |
| birthday_year_id  | integer | null: false |
| birthday_month_id | integer | null: false |
| birthday_day_id   | integer | null: false |
### Association
- has_many :items
- has_many :comments
- has_one :credit_card
- has_one :adress

## items テーブル
| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| user_id        | references | null: false, foreign_key: true |
| price          | integer    | null: false |
| image          | text       | null: false |
| name           | string     | null: false |
| description    | text       | null: false |
| category_id    | integer    | null: false |
| status_id      | integer    | null: false |
| ship_charge_id | integer    | null: false |
| ship_region_id | integer    | null: false |
| ship_day_id    | integer    | null: false |
### Association
- belongs_to :user
- has_many :comments

## credit_cards テーブル
| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| user_id          | references | null: false, foreign_key: true |
| number           | string     | null: false |
| expiration_month | string     | null: false |
| expiration_year  | string     | null: false |
| security_code    | string     | null: false |
### Association
- belongs_to :user

## addresses テーブル
| Column       | Type       | Options     |
| -----------¥ | ---------- | ----------- |
| user_id      | references | null: false, foreign_key: true |
| postcode     | string     | null: false |
| state_id     | integer    | null: false |
| city         | string     | null: false |
| block        | string     | null: false |
| building     | string     | null: false |
| phone_number | string     | null: false |
### Association
- belongs_to :user

## comments テーブル
| Column  | Type       | Options                        |
| ------- |  -------   | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |
| comment | text       |
### Association
- belongs_to :user
- belongs_to :item


### メモ
語尾に「_id」はアクティブハッシュで番号選択の為カラム型はinteger
usersテーブル→正規表現/文字数制限オプション
販売価格でJSで実装（販売手数料/販売利益）
commentsテーブルは商品詳細に入力欄がある為記述、但し、入力しても反映されない為恐らく不要


# README
This README would normally document whatever steps are necessary to get the
application up and running.
Things you may want to cover:
* Ruby version
* System dependencies
* Configuration
* Database creation
* Database initialization
* How to run the test suite
* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions
* ...
