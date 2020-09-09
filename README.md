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

| Column      | Type     | Options                   |
| ----------- | -------- | ------------------------- |
| nickname    | string   | null: false, unique: true |
| email       | string   | null: false, unique: true |
| password    | string   | null: false, unique: true |
| birthday    | date     | null: false               |

### Association

- has_many :products
- has_one buy

## products テーブル

| Column             | Type         | Options                  |
| ------------------ | ------------ | ------------------------ |
| image              | string       | null: false              |
| product name       | string       | null: false, limit: 40   |
| description        | text         | null: false, limit: 1000 |
| category           | integer      | null: false              |
| status             | integer      | null: false              |
| fee                | integer      | null: false              |
| area               | integer      | null: false              |
| days               | integer      | null: false              |
| price              | integer      | null: false              |

### Association

- has_one :buy

## buy テーブル

| Column  | Type       | Options     |
| ------- | ---------- | ----------- |
| user    | string     | null: false |
| product | string     | null: false |

### Association

- has_one :products

## address テーブル

| Column              | Type          | Options     |
| ------------------- | ------------- | ----------- |
| postal code         | string        | null: false |
| prefectures         | string        | null: false |
| cities              | string        | null: false |
| number              | string        | null: false |
| building            | string        | null: false |
| phone number        | string        | null: false |

### Association

- belongs_to :users
- belongs_to :buy