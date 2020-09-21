#　テーブル設計

## users　テーブル

| Column           | Type    | Option      |
| ---------------- | ------- | ----------- |
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| first_name       | string  | null: false |
| family_name      | string  | null: false |
| first_name_kana  | string  | null: false |
| family_name_kana | string  | null: false |
| birth            | date    | null: false |

### Association

- has_many :exhibitions
- has_many :purchases

## exhibitions テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| item_name    | string     | null: false                    |
| introduction | text       | null: false                    |
| category_id  | integer    | null: false                    |
| status_id    | integer    | null: false                    |
| postage_id   | integer    | null: false                    |
| area_id      | integer    | null: false                    |
| days_id      | integer    | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :purchases
- belongs_to_active_hash :category_id
- belongs_to_active_hash :status_id
- belongs_to_active_hash :postage_id
- belongs_to_active_hash :area_id
- belongs_to_active_hash :days_id

## purchases テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| exhibition   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :exhibition
- has_one :delivery


## deliveries テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| purchase       | references | null: false, foreign_key: true |
| postal_code    | string     | null: false                    |
| area_id        | integer    | null: false                    |
| city           | string     | null: false                    |
| block          | string     | null: false                    |
| build          | string     |                                |
| tel            | string     | null: false                    |


### Association

- belongs_to :purchase
- belongs_to_active_hash :area_id
