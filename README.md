## users テーブル

| Column           | Type    | Options                   |
| -----------------| ------- | ------------------------- |
| nickname         | string  | null: false               |
| email            | string  | null: false, unique: true |
| user_password    | string  | null: false               |
| family_name      | string  | null: false               |
| first_name       | string  | null: false               |
| family_name_kana | string  | null: false               |
| fist_name_kana   | string  | null: false               |
| birth_day        | integer | null: false               |


### Association

- has_many :items
- has_many :orders

## items テーブル

| Column      | Type       | Options                       |
| ----------- | ------     | ------------------------------|
| image       |            |                               |
| name        | string     | null: false                   |
| description | text       | null: false                   |
| category    | integer    | null: false                   |
| status      | integer    | null: false                   |
| cost        | integer    | null: false                   |
| area        | integer    | null: false                   |
| days        | integer    | null: false                   |
| item_price  | integer    | null: false                   |
| user_id     | references | null: false, foreign_key:true |

### Association

- belongs_to :user
- has_one    :order

## orders テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key:true  |
| item_id   | references | null: false, foreign_key:true  |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :destination

## destination テーブル

| Column       | Type       | Options                       |
| -------------| ---------- | ----------------------------- |
| postcode     | string     | null: false                   |
| prefecture   | string     | null: false,                  |
| city         | string     | null: false                   |
| block        | string     | null: false                   |
| phone_number | string     | null: false, unique: true     |
| user_id      | references | null: false, foreign_key:true |
| item_id      | references | null: false, foreign_key:true |

### Association

- belongs_to :order