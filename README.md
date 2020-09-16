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

| Column               | Type     | Options                   |
| -------------------- | -------- | ------------------------- |
| nickname             | string   | null: false, unique: true |
| email                | string   | null: false, unique: true |
| password             | string   | null: false               |
| birthday             | date     | null: false               |
| surname              | string   | null: false               |
| first_name           | string   | null: false               |
| surname_phonetic     | string   | null: false               |
| first_name_phonetic  | string   | null: false               |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column             | Type         | Options                        |
| ------------------ | ------------ | ------------------------------ |
| item_name          | string       | null: false, limit: 40         |
| description        | text         | null: false, limit: 1000       |
| category           | integer      | null: false                    |
| status             | integer      | null: false                    |
| fee                | integer      | null: false                    |
| area               | integer      | null: false                    |
| days               | integer      | null: false                    |
| price              | integer      | null: false                    |
| user               | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy

## buys テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column              | Type          | Options                        |
| ------------------- | ------------- | ------------------------------ |
| postal_code         | string        | null: false                    |
| prefectures         | integer       | null: false                    |
| cities              | string        | null: false                    |
| number              | string        | null: false                    |
| building            | string        |                                |
| phone_number        | string        | null: false                    |
| buy                 | references    | null: false, foreign_key: true |

### Association

- belongs_to :buy