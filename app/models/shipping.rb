class Shipping < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :purchase
  belongs_to :prefecture

  validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: "3桁ハイフン4桁の半角文字列で入力してください" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city, presence: true
  validates :street, presence: true
  validates :tel_number, format: { with: /\A\d{10,11}\z/, message: "はハイフン抜きで半角数値で入力してください" }
end
end
