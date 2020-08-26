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

- has_many : items
- has_many :items, through: trade
- has_many : trades
- has_one : address

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| image  | string | null: false |
| price  | integer | null: false | 

### Association

- has_many : users
- has_many : trade

## trade テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
|  user  |  string  | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- has_one : address
- belongs_to :items

## address テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
|prefecture| references | null: false, foreign_key: true |
|  city  | references | null: false, foreign_key: true |
|address_line_1| references | null: false, foreign_key: true |
|address_line_2| references |  foreign_key: true |
| phone  | references | null: false, foreign_key: true |
| trade  | references | null: false, foreign_key: true |
| user  | references | null: false, foreign_key: true |

### Association
- belongs_to : trade
- belongs_to : users