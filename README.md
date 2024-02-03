# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |

  Association
- has_many :items
- has_many :orders


## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key:true  |   
| order            | string     | foreign_key:true               |
| item_name        | string     | null: false                    |
| explain          | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| cost_bearer_id   | integer    | null: false                    |
| shipping_area_id | integer    | null: false                    |
| delivery_day_id  | integer    | null: false                    |
| price            | integer    | null: false                    |

  Association
- belongs_to :user
- belongs_to :order
- belongs_to :shipping


## orders テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key:true  |
| item_name        | references | null: false, foreign_key:true  |
| price            | references | null: false, foreign_key:true  |

  Association
- belongs_to :user
- belongs_to :item
- has_one :shipping

## shippings テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | integer    | null: false                    |
| prefectures_id   | integer    | null: false                    |
| municipalities   | string     | null: false                    |
| street_address   | string     | null: false                    |
| building         | string     |                                |
| phone_number     | integer    | null: false                    |

  Association
- belongs_to :order

