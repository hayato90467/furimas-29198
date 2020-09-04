# README

# テーブル設計

## users テーブル

| Column           | Type    | Options     |
| ---------------  | ------  | ----------- |
| name             | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| nickname         | string  | null: false |
| first_name       | string  | null: false |
| family_name      | string  | null: false |
| first_name_kana  | string  | null: false |
| family_name_kana | string  | null: false |
| date             | string  | null: false |



### Association

- has_many :items
- has_many :purchases
- has_many :users_items


## items テーブル

| Column               |   Type    |         Options                |
| -------------------- | --------  | ------------------------------ |
| user_id              | string    | null: false,                   |
| name                 | string    | null: false,                   |
| name_description     | text      | null: false,                   |
| name_category_id     | integer   | null: false,                   |
| name_condition_id    | integer   | null: false,                   |
| send_burden_id       | integer   | null: false,                   |
| send_area_id         | integer   | null: false,                   |
| send_day_id          | integer   | null: false,                   |
| price                | string    | null: false,                   |



### Association

- belongs_to :user
- has_many :user_item



## users_items テーブル

| Column               |   Type    |         Options                |
| -------------------- | --------  | ------------------------------ |
| user_id              | integer   | null: false, foreign_key: true |
| itmes_id             | integer   | null: false, foreign_key: true |


- belong_to :item

### Association

- belongs_to :user
- belongs_to :item
- has_one : purchase





## purchases テーブル

| Column           | Type       | Options                      |
| ---------------- | ---------- | ---------------------------- |
| user_item_id     | integer    | null: false,                 |
| prefectures_id   | integer    | null: false,                 |
| post             | string     | null: false,                 |
| city             | string     | null: false,                 |
| address          | string     | null: false,                 | 
| building         | string     |                              |
| mobile           | string     | null: false,                 |



### Association

- belongs_to :user_item