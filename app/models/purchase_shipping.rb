class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :street, :building, :tel_number, :token

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :token, presence: { message: 'カード情報を入力してください' }

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'は3桁ハイフン4桁の半角文字列で入力してください' }
    validates :city
    validates :street
    validates :tel_number,format: { with: /\A\d{10,11}\z/, message: 'はハイフン抜きで半角数値で入力してください' }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipping.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street: street, 
                  building: building, tel_number: tel_number, purchase_id: purchase.id)
  end
end
