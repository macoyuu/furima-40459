#テーブル設計

## users テーブル

|Column             |Type    |Options  |
|-------------------|--------|---------|
|Nickname           |string  |not null |
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
|prefecture_id      |string     |not null |
|shipping_days_id   |integer    |not null |
|item_price         |integer    |not null |
|user               |references |not null, foreign_key |

-belongs_to :users
-has_one :purchases

## purchases テーブル
|Column             |Type       |Options  |
|-------------------|-----------|---------|
|item               |references |not null, foreign_key |
|user               |references |not null, foreign_key |

-belongs_to :users
-belongs_to :items
-has_one :shipping


## shipping テーブル
|Column             |Type       |Options  |
|-------------------|-----------|---------|
|post_code          |string     |not null |
|prefecture_id      |string     |not null |
|city               |string     |not null |
|street             |string     |not null |
|building           |string     |         |
|tel_number         |string     |not null |
|purchase           |references |not null, foreign_key |

-belongs to :purchases



### Association
- user
   - has_many :items
   - has_many :purchases

- items
   -belongs_to :users
   -has_one :purchases

- buy
   -belongs_to :users
   -belongs_to :items
   -has_one :shipping

- shipping
   -belongs to :purchases

