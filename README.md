# furima-28244 テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false, unique:true |
| password         | string | null: false |
| password_confirm | string | null: false |
| last_name        | string | null: false |
| first_name       | string | null: false |
| last_name_kana   | string | null: false |
| first_name_kana  | string | null: false |
| birthday         | date   | null: false |

### Association
- has_many :items
- has_many :trades
- has_many :comments

## items テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| user_id        | integer | null: false, foreign_key: true |
| price          | integer | null: false |
| name           | string  | null: false |
| description    | text    | null: false |
| category_id    | integer | null: false |
| status_id      | integer | null: false |
| ship_charge_id | integer | null: false |
| ship_region_id | integer | null: false |
| ship_day_id    | integer | null: false |

### Association
- has_one :trade
- has_one :address
- has_many :comments
- has_one_attached :image
- belongs_to :user
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :ship_charge
- belongs_to_active_hash :ship_region
- belongs_to_active_hash :ship_day

## addresses テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| item_id      | integer | null: false, foreign_key: true |
| postcode     | string  | null: false |
| state_id     | integer | null: false |
| city         | string  | null: false |
| block        | string  | null: false |
| building     | string  |
| phone_number | string  | null: false |

### Association

- belongs_to :item

## comments テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| user_id | integer | null: false, foreign_key: true |
| item_id | integer | null: false, foreign_key: true |
| comment | text    |

### Association

- belongs_to :user
- belongs_to :item

## trades テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| user_id | integer | null: false, foreign_key: true |
| item_id | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item