#テーブル設計

## users テーブル

|Column             |Type    |Options  |
|-------------------|--------|---------|
|nickname           |string  |not null |
|email              |string  |not null, unique |
|encrypted_password |string  |not null |
|first_name         |string  |not null |
|last_name          |string  |not null |
|first_name_kana    |string  |not null |
|last_name_kana     |string  |not null |
|birth_date         |date    |not null |

- has_many :items
- has_many :purchases

## items テーブル

|Column             |Type       |Options  |
|-------------------|-----------|---------|
|item_name          |string     |not null |
|item_explanation   |text       |not null |
|item_category_id   |integer    |not null |
|item_condition_id  |integer    |not null |
|shipping_fee_id    |integer    |not null |
|prefecture_id      |integer    |not null |
|shipping_days_id   |integer    |not null |
|item_price         |integer    |not null |
|user               |references |not null, foreign_key |

- belongs_to :user
- has_one :purchase

## purchases テーブル
|Column             |Type       |Options  |
|-------------------|-----------|---------|
|item               |references |not null, foreign_key |
|user               |references |not null, foreign_key |

- belongs_to :user
- belongs_to :item
- has_one :shipping


## shippings テーブル
|Column             |Type       |Options  |
|-------------------|-----------|---------|
|post_code          |string     |not null |
|prefecture_id      |integer    |not null |
|city               |string     |not null |
|street             |string     |not null |
|building           |string     |         |
|tel_number         |string     |not null |
|purchase           |references |not null, foreign_key |

- belongs_to :purchase



### Association
- user
   - has_many :items
   - has_many :purchases

- items
   - belongs_to :user
   - has_one :purchase

- buy
   - belongs_to :user
   - belongs_to :item
   - has_one :shipping

- shipping
   - belongs to :purchase

