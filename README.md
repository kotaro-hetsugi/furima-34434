# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nick_name          | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :products
- has_many :buys

## products テーブル

| Column                  | Type       | Options           |
| ----------------------- | ---------- | ----------------- |
| title                   | string     | null: false       |
| text                    | text       | null: false       |
| category_id             | integer    | null: false       |
| status_id               | integer    | null: false       |
| delivery_fee_role_id    | integer    | null: false       |
| delivery_source_area_id | integer    | null: false       |
| delivery_days_id        | integer    | null: false       |
| price                   | integer    | null: false       |
| user                    | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :buy

## buys テーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| user            | references | foreign_key: true |
| product         | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :buyer

## buyers テーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| postal_code     | string     | null: false       |
| prefectures_id  | integer    | null: false       |
| municipality    | string     | null: false       |
| address         | string     | null: false       |
| building_name   | string     |                   |
| phone_number    | string     | null: false       |
| buy             | references | foreign_key: true |

### Association

- belongs_to :buy