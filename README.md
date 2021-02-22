# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| email           | string | null: false |
| password        | string | null: false |
| nick_name       | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | date   | null: false |

### Association

- has_many :products
- has_many :buyers

## products テーブル

| Column               | Type       | Options     |
| -------------------- | ---------- | ----------- |
| image                |            |             | <!-- ActiveStorageで実装  -->
| title                | string     | null: false | 
| text                 | text       | null: false |
| category             | string     | null: false |
| status               | string     | null: false |
| delivery_fee_role    | boolean    | null: false |
| delivery_source_area | string     | null: false |
| delivery_days        | integer    | null: false |
| price                | integer    | null: false |
| stock                | boolean    | null: false |
| user                 | references |             |

### Association

- belongs_to :user
- belongs_to :buyer

## buyers テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| card_number     | integer    | null: false |
| card_date_month | integer    | null: false |
| card_date_year  | integer    | null: false |
| card_code       | integer    | null: false |
| postal_code     | string     | null: false |
| prefectures     | string     | null: false |
| municipality    | string     | null: false |
| address         | string     | null: false |
| building_name   | string     |             |
| phone_number    | integer    | null: false |
| user            | references |             |
| product         | references |             |

### Association

- belongs_to :user
- belongs_to :product