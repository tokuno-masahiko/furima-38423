# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------  |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |

### Association

<!-- - has_many : comments -->
- has_many : items
- has_many : purchases

<!-- ## comments テーブル

| Column    | Type      | Options                        |
| --------- | --------- | ------------------------------ |
| content   | text      | null: false                    |
| item      | reference | null: false, foreign_key: true |
| user      | reference | null: false, foreign_key: true |

### Association

- belongs_to : user
- belongs_to : item -->

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| title            | string     | null: false                    |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| fee_id           | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| shipping_date_id | integer    | null: false                    |
| item_fee         | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

<!-- - has_many :comments -->
- belongs_to :user
- has_one : purchase

## purchases テーブル
<!-- 購入者と商品 -->

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type      | Options                        |
| ------------- | --------- | ------------------------------ |
| postal_code   | string    | null: false                    |
| prefecture_id | integer   | null: false                    |
| city          | string    | null: false                    |
| address       | string    | null: false                    |
| house_number  | string    | null: false                    |
| phone_number  | string    | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase

