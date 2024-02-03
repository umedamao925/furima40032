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
| birth_year         | string | null: false               |
| birth_month        | string | null: false               |
| birth_day          | string | null: false               |

  Association
- has_many :items
- has_many :orders
- has_many :shippings


## items テーブル

| Column        | Type      | Options                        |
| ----------    | --------- | ------------------------------ |
| item_name     | reference | null: false, foreign_key: true |
| explain       | text      | null: false                    |
| category      | string    | null: false                    |
| condition     | string    | null: false                    |
| cost bearer   | string    | null: false                    |
| shipping_area | string    | null: false                    |
| delivery_days | string    | null: false                    |
| price         | reference | null: false, foreign_key: true |
| commission    | string    | null: false                    |
| profit        | reference | null: false                    |

  Association
- belongs_to :users
- belongs_to :orders
- belongs_to :shippings




## orders テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | references | null: false, foreign_key:true  |
| price            | references | null: false, foreign_key:true  |

  Association
- belongs_to :users
- belongs_to :items
- belongs_to :shippings

## shippings テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefectures      | string     | null: false                    |
| municipalities   | string     | null: false                    |
| street_address   | string     | null: false                    |
| building         | string     | null: false                    |
| telephone_number | string     | null: false                    |

  Association
- belongs_to :users
- belongs_to :items
- belongs_to :orders

