#テーブル設計

## users テーブル

|Column             |Type    |Options     |
|-------------------|--------|------------|
|nickname           |string  |null: false |
|email              |string  |null: false, unique |
|encrypted_password |string  |null: false |
|first_name         |string  |null: false |
|last_name          |string  |null: false |
|first_name_kana    |string  |null: false |
|last_name_kana     |string  |null: false |
|birth_date         |date    |null: false |

- has_many :items
- has_many :purchases

## items テーブル

|Column             |Type       |Options     |
|-------------------|-----------|------------|
|item_name          |string     |null: false |
|item_explanation   |text       |null: false |
|item_category_id   |integer    |null: false |
|item_condition_id  |integer    |null: false |
|shipping_fee_id    |integer    |null: false |
|prefecture_id      |integer    |null: false |
|shipping_days_id   |integer    |null: false |
|item_price         |integer    |null: false |
|user               |references |null: false, foreign_key: true |

- belongs_to :user
- has_one :purchase

## purchases テーブル
|Column             |Type       |Options  |
|-------------------|-----------|---------|
|item               |references |null: false, foreign_key: true |
|user               |references |null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one :shipping


## shippings テーブル
|Column             |Type       |Options     |
|-------------------|-----------|------------|
|post_code          |string     |null: false |
|prefecture_id      |integer    |null: false |
|city               |string     |null: false |
|street             |string     |null: false |
|building           |string     |            |
|tel_number         |string     |null: false |
|purchase           |references |null: false, foreign_key: true |

- belongs_to :purchase



### Association
- user
   - has_many :items
   - has_many :purchases

- item
   - belongs_to :user
   - has_one :purchase

- purchase
   - belongs_to :user
   - belongs_to :item
   - has_one :shipping

- shipping
   - belongs to :purchase

