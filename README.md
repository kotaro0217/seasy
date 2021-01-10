# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| family_name        | string | null: false               |
| read_first_name    | string | null: false               |
| read_family_name   | string | null: false               |
| birth              | date   | null: false               |

### association
- has_many :items
- has_many :purchases

##  itemsテーブル

| Column          | Type      | Options                        |
| --------------- | --------- | ------------------------------ |
| user            | reference | null: false, foreign_key: true |
| name            | string    | null: false                    |
| text            | text      | null: false                    |
| value           | integer   | null: false                    |
| category_id     | integer   | null: false                    |
| condition_id    | integer   | null: false                    |
| shipment_day_id | integer   | null: false                    |
| postage_id      | integer   | null: false                    |
| prefecture_id   | integer   | null: false                    |

### association
- has_one :purchase
- belongs_to :user

##  purchasesテーブル

| Column | Type      | Options                        |
| ------ | --------- | ------------------------------ |
| user   | reference | null: false, foreign_key: true |
| item   | reference | null: false, foreign_key: true |

### association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address

##  shipping_addressテーブル

| Column   | Type      | Options                        |
| -------- | --------- | ------------------------------ |
| purchase | reference | null: false, foreign_key: true |
| postcode | string    | null: false                    |
| area_id  | integer   | null: false                    |
| city     | string    | null: false                    |
| block    | string    | null: false                    |
| building | string    |                                |
| phone    | string    | null: false                    |

### association
- belongs_to :purchase
