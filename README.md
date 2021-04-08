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
- has_many :purchases

## destinations テーブル

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| post_code                           | string     | null: false                    |
| prefecture_id                       | integer    | null: false                    |
| city                                | string     | null: false                    |
| address                             | string     | null: false                    |
| building_name                       | string     |                                |
| phone_number                        | string     | null: false                    |
| user_id                             | integer    | null: false, foreign_key: true |
| product_id                          | integer    | null: false, foreign_key: true |

### Association

- belongs_to :purchases

## productsテーブル

| Column        | Type       | Options                        |
|-------------  |------------|--------------------------------|
| status        | string     | null: false                    |
| shipping_cost | string     | null: false                    |
| shipping_days | string     | null: false                    |
| area          | string     | null: false                    |
| category      | string     | null: false                    |
| price         | integer    | null: false                    |
| explanation   | text       | null: false                    |
| name          | string     | null: false                    |


### Association

- belongs_to :user
- belongs_to_active_hash :prefecture
- has_one :purchases

## purchases

| Column          | Type      | Options                        |
| ----------------|-----------|--------------------------------|
| user_id         | integer   | null: false, foreign_key: true |
| destination_id  | integer   | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- belongs_to :destinations