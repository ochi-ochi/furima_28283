# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

# テーブル設計

## user テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| name            | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| family_name     | string | null: false |
| first_name      | string | null: false |
| family_name_kana| string | null: false |
| first_name_kana | string | null: false |
| birth_date      | date   | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column         | Type        | Options                       |
| -------------- | ------------| ----------------------------- |
| user           | reference   | null: false,foreign_key: true |
| name           | string      | null: false                   |
| image          | string      | null: false                   |
| introduction   | text        | null: false                   |
| price          | integer     | null: false                   |
| category_id    | integer     | null: false                   |
| prefecture_id  | integer     | null: false                   |
| delivery_day   | integer     | null: false                   |
| delivery_fee_id| integer     | null: false                   |
| states_id      | integer     | null: false                   |

### Association
- belongs_to :user
- has_one :purchase
- belongs_to_active_hash :categories
- belongs_to_active_hush :prefecture
- belongs_to_active_hush :delivery_day
- belongs_to_active_hush :delivery_fee
- belongs_to_active_hush :state_id

## purchase テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | reference  | null: false, foreign_key: true |
| item     | reference  | null: false, foreign_key: true |

### Association

- belongs_to :item
- has one :purchase_add
- belongs_to :user

## purchase_add テーブル 

| Column         | Type        | Options                        |
| -------------- | ------------| ------------------------------ |
| postal_code    | string      | null: false                    |
| prefecture_id  | integer     | null: false                    |
| city           | string      | null: false                    |
| house_number   | string      | null: false                    | 
| building_name  | string      |                                |
| tel_number     | string      | null: false                    |
| purchase       | reference   | null: false, foreign_key: true |


### Association

- belongs_to_active_hush :prefecture
- belongs_to :purchase




* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
