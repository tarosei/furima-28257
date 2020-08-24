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
- has_many :through: users_items

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| item   | string | null: false |
|picture |  gif   | null: false |
|category| string | null: false |
| status | string | null: false |
| comment| string | null: false |
|price   | integer | null: false |
|selling_price| integer | null: false |

### Association

- has_many :users
- has_many : through: users_items


## users_items テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| custom | references | null: false, foreign_key: true |
| address| references | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :users

