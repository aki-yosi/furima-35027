# DB 設計

## users テーブル

| Column             | Type                | Options                  |
|--------------------|---------------------|------------------------- |
| nickname           | string              | null: false              |
| encrypted_password | string              | null: false              |
| email              | string              | null: false, unique: true|
| family_name        | string              | null: false              |
| first_name         | string              | null: false              |
| family_name_kana   | string              | null: false              |
| first_name_kana    | string              | null: false              |
| birth_day          | date                | null: false              |

### Association

* has_many :products
- belongs_to :destination
- has_one :purchase

## destination テーブル

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| user_id                             | integer    | null: false, foreign_key: true |
| post_code                           | string     | null: false                    |
| prefecture                          | string     | null: false                    |
| city                                | string     | null: false                    |
| address                             | string     | null: false                    |
| building_name                       | string     |                                |
| phone_number                        | string     | null: false                    |

### Association

- belongs_to :user

## productテーブル

| Column        | Type       | Options                        |
|-------------  |------------|--------------------------------|
| name          | string     | null: false                    |
| price         | string     | null: false                    |
| description   | text       | null: false                    |
| status        | string     | null: false                    |
| shipping_cost | string     | null: false                    |
| shipping_days | string     | null: false                    |
| prefecture_id | string     | null: false                    |
| area          | string     | null: false                    |
| category_id   | integer    | null: false, foreign_key: true |
| brand_id      | integer    | null: false, foreign_key: true |
| shipping_id   | integer    | null: false, foreign_key: true |
| user_id       | integer    | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to_active_hash :prefecture
- has_one :purchase

## purchase

| Column   | Type      | Options                        |
| ---------|-----------|--------------------------------|
| user_id  | integer   | null: false, foreign_key: true |
| item_id  | integer   | null: false, foreign_key: true |

### Association

- has_one :user
- has_one :product