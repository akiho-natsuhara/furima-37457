# テーブル設計

##users テーブル
| Colum             | Type   | Options                   |
|-------------------|------- |---------------------------|
|nickname           | string | null: false               |
|email              | string | null: false, unique: true |
|encrypted_password | string | null: false               |
|last_name          | string | null: false               |
|last_name_kana     | string | null: false               |
|first_name         | string | null: false               |
|first_name_kana    | string | null: false               |
|birthday           | date   | null: false               |

Association
- has_many: items
- has_many: purchases


##items テーブル
| Colum             | Type        | Options                        |
|-------------------|-------------|--------------------------------|
|name               | string      | null: false                    |
|text               | text        | null: false                    | 
|category_id        | integer     | null: false                    |
|status_id          | integer     | null: false                    |
|cost_id            | integer     | null: false                    |
|shipping_area_id   | integer     | null: false                    |
|shipping_days_id   | integer     | null: false                    |
|price              | integer     | null: false                    |
|user               | references  | null: false, foreign_key: true |

Association
- belongs_to : user
- has_one :purchase


##shipping_addresses テーブル
| Colum             | Type       | Options                           |
|-------------------|------------|-----------------------------------|
|post_code          | string     | null: false                       |
|prefecture_id      | integer    | null: false                       |
|city               | string     | null: false                       |
|house_number       | string     | null: false                       |
|building_name      | string     |                                   |
|phone_number       | string     | null: false                       |
|purchase           | references | null: false, foreign_key: true    |

Association
-belongs_to :purchase

##purchases テーブル
| Colum             | Type       | Options                           |
|-------------------|------------|-----------------------------------|
|user               | references | null: false, foreign_key: true    | 
|item               | references | null: false, foreign_key: true    | 

Association
- belongs_to: item
- has_one: shipping_address
- belongs_to: user
