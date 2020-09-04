# README

# テーブル設計
## top テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| search   | string | null: false |

### Association


- has_many :users
- has_many :sellers
- has_many :purchases



## users テーブル

| Column      | Type    | Options     |
| --------    | ------  | ----------- |
| name        | string  | null: false |
| email       | string  | null: false |
| password    | integer | null: false |
| Nickname    | string  | null: false |
| first_name  | string  | null: false |
| family_name | string  | null: false |
| first_name  | string  | null: false |
| family_name | string  | null: false |
| year        | string  | null: false |
| month       | string  | null: false |
| day         | sting   | null: false | 


### Association

- belongs_to :top
- has_many :items
- has_many :purchases


## items テーブル

| Column               |   Type    |         Options                |
| -------------------- | --------  | ------------------------------ |
| use_id               | string    | null: false,                   |
| image                | image     | null: false,                   |
| user                 | string    | null: false,                   |
| item                 | string    | null: false,                   |
| ITEM_DESCRIPTION     | string    | null: false,                   |
| item_category        | string    | null: false,                   |
| price                | string    | null:false                     |



### Association

- belongs_to :users
- has_one : purchases



| Column               |   Type    |         Options                |
| -------------------- | --------  | ------------------------------ |
| send_burden          | string    | null: false,                   |
| send_area            | string    | null: false,                   |
| send_day             | string    | null: false,                   |

## purchases テーブル

| Column           | Type       | Options                      |
| ---------------- | ---------- | ---------------------------- |
| items_id         | string     | null: false,                 |
| credit_number    | string     | null: false,                 |
| expiration       | string     | null: false,                 |
| date             | string     | null: false,                 |
| security_code    | string     | null: false,                 |
| post-code        | string     | null: false,                 |
| city             | string     | null: false,                 |
| address          | string     | null: false,                 |
| mobile           | string     | null: false,                 |



### Association

- belongs_to :users
- belongs_to :sellers
