#テーブル設計

## users テーブル

|Column             |Type    |Options  |
|-------------------|--------|---------|
|Nickname           |string  |NOT NULL |
|email              |string  |NOT NULL, UNIQUE |
|encrypted_password |string  |NOT NULL |
|name               |string  |NOT NULL |
|name_kana          |string  |NOT NULL |
|birth_date         |integer |NOT NULL |

## items テーブル

|Column             |Type       |Options  |
|-------------------|-----------|---------|
|item_name          |string     |NOT NULL |
|item_explanation   |text       |NOT NULL |
|item_category      |text       |NOT NULL |
|item_condition     |text       |NOT NULL |
|shipping_fee       |text       |NOT NULL |
|ship_from          |text       |NOT NULL |
|shipping_days      |integer    |NOT NULL |
|item_price         |integer    |NOT NULL |
|user               |references |NOT NULL, 外部キー |

## purchases テーブル
|Column             |Type       |Options  |
|-------------------|-----------|---------|
|item_name          |references |NOT NULL, 外部キー |
|item_price         |references |NOT NULL, 外部キー |
|user               |references |NOT NULL, 外部キー |
|shipping_address   |references |NOT NULL, 外部キー |

## shipping テーブル
|Column             |Type       |Options  |
|-------------------|-----------|---------|
|post_code          |integer    |NOT NULL |
|prefecture         |text       |NOT NULL |
|city               |text       |NOT NULL |
|street             |text       |NOT NULL |
|building           |text       |         |
|tel_number         |integer    |NOT NULL |
|user               |references |NOT NULL, 外部キー |



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

