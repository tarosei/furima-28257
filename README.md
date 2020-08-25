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

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
|first_name| string | null: false |
|last_name | string | null: false |
|first_name_kana|string|null: false|
|last_name_kana|string| null: false|
| birthday |  date  | null: false |

### Association

- has_many :items
- has_many :items, through: users_items
- has_many : trade
- has_one : address

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| item   |  text  | null: false |
| image  | string | null: false |
| comment| string | null: false |
| price  | integer | null: false |

### Association

- belongs_to :users
- has_many : through: users_items

## users_items テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| customer | string | null: false, foreign_key: true |
| address | string | null: false, foreign_key: true |
| users_id| string | null: false, foreign_key: true |
| items_id| string | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :users

## trade テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| users  | references | null: false, foreign_key: true |
| items   | references | null: false, foreign_key: true |

### Association
- has_one : address
- belongs_to :item
- has_many : items, through: users_items


## address テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
|  item  | references | null: false, foreign_key: true |
|prefecture| references | null: false, foreign_key: true |
|  city  | references | null: false, foreign_key: true |
|address_line_1| references | null: false, foreign_key: true |
|address_line_2| references | null: false, foreign_key: true |
| phone  | references | null: false, foreign_key: true |

### Association
- belongs_to : trade
- belongs_to : users