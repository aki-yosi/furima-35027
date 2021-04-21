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
| purchase_id                         | integer    | null: false, foreign_key: true |

### Association

- belongs_to :purchase

## productsテーブル

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| status_id        | integer    | null: false                    |
| shipping_cost_id | integer    | null: false                    |
| shipping_day_id  | integer    | null: false                    |
| area_id          | integer    | null: false                    |
| category_id      | integer    | null: false                    |
| price            | integer    | null: false                    |
| explanation      | text       | null: false                    |
| name             | string     | null: false                    |


### Association

- belongs_to :user
- belongs_to_active_hash :prefecture
- has_one :purchase

## purchases

| Column          | Type      | Options                        |
| ----------------|-----------|--------------------------------|
| user_id         | integer   | null: false, foreign_key: true |
| product_id      | integer   | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :destination

<!-- 環境変数プッシュ -->