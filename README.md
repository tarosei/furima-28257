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
- has_many : trades

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| image  | string | null: false |
| price  | integer | null: false | 
| category| string | null: false | 
| status | string | null: false | 
| item | string | null: false | 

### Association

- belongs_to : user
- has_one : trade

## trade テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- has_one : address
- belongs_to :item
- belongs_to :user

## address テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
|prefecture| integer | null: false, |
|  city  | string | null: false,  |
|address_line_1| string | null: false,  |
|address_line_2| string |   |
| phone  | string | null: false,  |
| trade  | references | null: false, foreign_key: true |

### Association
- belongs_to : trade