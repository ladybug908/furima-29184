#　テーブル設計

## users　テーブル

| Column           | Type    | Option      |
| ---------------- | ------- | ----------- |
| name             | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| first_name       | string  | null: false |
| family_name      | string  | null: false |
| first_name_kana  | string  | null: false |
| family_name_kana | string  | null: false |
| birth_year       | integer | null: false |
| birth_month      | integer | null: false |
| birth_day        | integer | null: false |

### Association

- has_many :exhibition
- has_many :shopping

## exhibitions テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| image    | string  | null: false |
| item_name     | string  | null: false |
| introduction  | text    | null: false |
| category      | string  | null: false |
| status        | string  | null: false |
| postage       | string  | null: false |
| area          | string  | null: false |
| days          | string  | null: false |
| price         | integer | null: false |


### Association

- belongs_to : user
- has_one :purchase

## purchases テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| credit_card   | integer | null: false |
| expire_month  | integer | null: false |
| expire_year   | integer | null: false |
| security_cord | integer | null: false |


### Association

-belongs_to :user
-belongs_to :exhibition
- has_one : delivery


## deliveries テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| postal_code    | integer | null: false |
| prefectures    | string  | null: false |
| city           | string  | null: false |
| block          | string  | null: false |
| build          | string  |             |
| tel            | integer | null: false |


### Association

-belongs_to :purchase