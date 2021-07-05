# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique:true|
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date | null: false |


### Association

- has_many :products
- has_one :purchasehistory



## address テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| postcode           | string     | null: false |
| prefecture_id      | integer    | null: false |
| city               | string     | null: false |
| block              | string     | null: false |
| building           | string     |             |
| phone_number       | string     | null: false |
| purchasehistory    | references | null: false, foreign_key: true |

### Association

- belongs_to :purchasehistory



## purchasehistory テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| product            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :address
- belongs_to :product




## products テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| product_name       | string  | null: false |
| text               | text    | null: false |
| category_id        | integer | null: false |
| status_id          | integer | null: false |
| shopping_charge_id | integer | null: false |
| delivery_area_id   | integer | null: false |
| delivery_day_id    | integer | null: false |
| price              | integer | null: false |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchasehistory



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
