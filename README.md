# テーブル設計

##users テーブル
| Colum             | Type   | Options     |
|-------------------|------- |-------------|
|nickname           | string | null: false |
|email              | string | null: false |
|encrypted_password | string | null: false |
|last_name          | string | null: false |
|last_name_kana     | string | null: false |
|first_name         | string | null: false |
|first_name_kana    | string | null: false |
|birthday           | date   | null: false |

Association
- has_many : items
- has_one : purchase


##items テーブル
| Colum             | Type        | Options                        |
|-------------------|-------------|--------------------------------|
|name               | string      | null: false                    |
|text               | text        | null: false                    |
|status             | integer     | null: false, default: 0        |
|cost               | integer     | null: false, default: 0        |
|shipping_area      | integer     | null: false, default: 0        |
|shipping_days      | integer     | null: false, default: 0        |
|price              | integer     | null: false                    |
|bland_id           | references  | foreign_key: true              |
|user_id            | references  | null: false, foreign_key: true |
|purchase_id        | references  | foreign_key: true              |

Association
- belongs_to : user
- belongs_to : bland
- has_many : images


##purchases テーブル
| Colum             | Type       | Options                           |
|-------------------|------------|-----------------------------------|
|last_name          | string     | null: false                       |
|last_name_kana     | string     | null: false                       |
|first_name         | string     | null: false                       |
|first_name_kana    | string     | null: false                       |
|post_code          | string     | null: false                       |
|prefecture_id      | integer    | null: false, default: 0           |
|city               | string     | null: false                       |
|house_number       | integer    | null: false                       |
|building_name      | string     | null: false                       |
|phone_number       | integer    | null: false                       |
|user_id            | references | null: false, foreign_key: true    | 

Association
- belongs_to : user
- has_one : pay_card

##bland テーブル
| Colum             | Type        | Options        |
|-------------------|-------------|----------------|
| name              | string      | index: true    |

Association
- has_many : items

##images テーブル
| Colum         | Type       | Options                        |
|---------------|------------|--------------------------------|
| image         | string     | null: false                    |
| item_id       | references | null: false, foreign_key: true |

Association
- belongs_to : item

##pay_cards テーブル
| Colum         | Type       | Options                        |
| user_id       | references | null: false, foreign_key: true |
| payjp_id      | string     | null: false                    |

Association
- belongs_to : purchase