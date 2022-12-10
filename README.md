# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------  |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false, 英数字制約   |
| last_name          | string | null: false, 全角制約     |
| first_name         | text   | null: false, 全角制約     |
| last_name_kana     | text   | null: false, カタカナ制約 |
| first_name_kana    | text   | null: false, カタカナ制約 |

### Association

- has_many : comments
- has_many : items

## comments テーブル

| Column    | Type      | Options                        |
| --------- | --------- | ------------------------------ |
| content   | text      | null: false                    |
| item      | reference | null: false, foreign_key: true |
| user      | reference | null: false, foreign_key: true |

### Association

- belongs_to : user
- belongs_to : item

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| title           | string     | null: false                    |
| description     | text       | null: false                    |
| detail_category | string     | null: false                    |
| detail_status   | string     | null: false                    |
| delivery_fee    | string     | null: false                    |
| delivery_region | string     | null: false                    |
| delivery_date   | string     | null: false                    |
| item_fee        | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- has_many :comments
- belongs_to :user
