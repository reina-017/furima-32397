## users テーブル

| Column             | Type    | Options                   |
| -----------------  | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| family_name        | string  | null: false               |
| first_name         | string  | null: false               |
| family_name_kana   | string  | null: false               |
| fist_name_kana     | string  | null: false               |
| birth_day          | date    | null: false               |


### Association

- has_many :items
- has_many :orders

## items テーブル

| Column      | Type       | Options                       |
| ----------- | ------     | ------------------------------|
| name        | string     | null: false                   |
| description | text       | null: false                   |
| category_id | integer    | null: false                   |
| status_id   | integer    | null: false                   |
| cost_id     | integer    | null: false                   |
| area_id     | integer    | null: false                   |
| days_id     | integer    | null: false                   |
| item_price  | integer    | null: false                   |
| user        | references | null: false, foreign_key:true |

### Association

- belongs_to :user
- has_one    :order

## orders テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key:true  |
| item      | references | null: false, foreign_key:true  |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :destination

## destinations テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| postcode      | string     | null: false                   |
| prefecture_id | integer    | null: false,                  |
| city          | string     | null: false                   |
| block         | string     | null: false                   |
| building      | string     |                               |
| phone_number  | string     | null: false, unique: true     |
| order         | references | null: false, foreign_key:true |

### Association

- belongs_to :order