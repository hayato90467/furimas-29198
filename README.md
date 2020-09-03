# README

# テーブル設計

## user テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| Nickname | string |             |

### Association

- has_many :seller
- has_many :rooms, through: room_users
- has_many :messages

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :room_users
- has_many :users, through: room_users
- has_many :messages

## seller テーブル

| Column | Type       | Options                        |
| image  |            | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- has_many : buyer

## buyer テーブル

| Column     | Type       | Options                        |
| -------    | ---------- | ------------------------------ |
| content    | string     |                                |
| user_id    | references | null: false, foreign_key: true |
| room       | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to : seller
