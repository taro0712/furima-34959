# テーブル設計

## card テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| card_number        | string | null: false |
| exp_month          | string | null: false |
| exp_year           | string | null: false |
| approvalcode       | string | null: false |
| user               | references | null: false |

### Association

- belongs_to :users



## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| password           | string | null: false |

### Association

- has_many :card
- has_many :address
- has_many :products
- has_many :comments
- has_one :profile



## profile テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| year_birth         | string | null: false |
| day_birth          | string | null: false |

### Association

- belongs_to :users



## address テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| postcode           | string | null: false |
| prefecture_id      | string | null: false |
| city               | string | null: false |
| block              | string | null: false |
| building           | string | null: false |
| phone_number       | string | null: false |
| user               | references | null: false |

### Association

- belongs_to :users
- belongs_to :products



## products テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| image              |                      |
| product_name       | text   | null: false |
| text               | text   | null: false |
| category           | string | null: false |
| status             | string | null: false |
| shopping_charges   | string | null: false |
| delivery_area      | string | null: false |
| delivery_days      | string | null: false |
| price              | string | null: false |
| fee                | string | null: false |
| profit             | string | null: false |
| user               | references | null: false |

### Association

- belongs_to :users
- has_one :address
- has_many :comments



## comments テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| text               | text | null: false |
| user               | references | null: false |

### Association

- belongs_to :users
- belongs_to :products





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
