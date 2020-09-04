# README

# テーブル設計

## users テーブル

| Column      | Type    | Options     |
| --------    | ------  | ----------- |
| name        | string  | null: false |
| email       | string  | null: false |
| password    | string  | null: false |
| Nickname    | string  | null: false |
| first_name  | string  | null: false |
| family_name | string  | null: false |
| first_name  | string  | null: false |
| family_name | string  | null: false |
| date        | string  | null: false |



### Association

- has_many :items
- has_many :purchases
- has_many :users_items


## items テーブル

| Column               |   Type    |         Options                |
| -------------------- | --------  | ------------------------------ |
| use_id               | string    | null: false,                   |
| image                | image     | null: false,                   |
| user                 | string    | null: false,                   |
| item                 | string    | null: false,                   |
| item_description     | text      | null: false,                   |
| item_category        | string    | null: false,                   |
| send_burden          | string    | null: false,                   |
| send_area            | string    | null: false,                   |
| send_day             | string    | null: false,                   |
| price                | string    | null: false,                   |



### Association

- belongs_to :user
- has_one : purchase


## users_items テーブル

| Column               |   Type    |         Options                |
| -------------------- | --------  | ------------------------------ |
| use_id               | string    | null: false,                   |
| itmes_id             | string    | null: false,                   |




### Association

- belongs_to :user
- has_one : purchase





## purchases テーブル

| Column           | Type       | Options                      |
| ---------------- | ---------- | ---------------------------- |
| items_ id        | string      | null: false,                |
| prefectures      | string     | null: false,                 |
| post-code        | string     | null: false,                 |
| city             | string     | null: false,                 |
| address          | string     | null: false,                 |
| building_number  | string     | null: false,                 |
| mobile           | string     | null: false,                 |



### Association

- belongs_to :user
- belongs_to :item
