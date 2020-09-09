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

| Column          | Type     | Options                   |
| --------------- | -------- | ------------------------- |
| nickname        | string   | null: false, unique: true |
| email           | string   | null: false, unique: true |
| password        | string   | null: false               |
| birthday        | date     | null: false               |
| surname         | string   | null: false               |
| first_name      | string   | null: false               |
| phonetic_name1  | string   | null: false               |
| phonetic_name2  | string   | null: false               |

### Association

- has_many :products
- has_many :buys

## products テーブル

| Column             | Type         | Options                        |
| ------------------ | ------------ | ------------------------------ |
| product_name       | string       | null: false, limit: 40         |
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
| product | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :address

## addresses テーブル

| Column              | Type          | Options                        |
| ------------------- | ------------- | ------------------------------ |
| postal_code         | string        | null: false                    |
| prefectures         | integer       | null: false                    |
| cities              | string        | null: false                    |
| number              | string        | null: false                    |
| building            | string        |                                |
| phone number        | string        | null: false                    |
| buy                 | references    | null: false, foreign_key: true |

### Association

- belongs_to :buy