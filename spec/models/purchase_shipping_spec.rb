require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_shipping = FactoryBot.build(:purchase_shipping, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '購入できる場合' do
      it 'user_id、item_id、post_code、prefecture_id、city、street、building、tel_numberが存在すれば登録できる' do
        expect(@purchase_shipping).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @purchase_shipping.building = ''
        expect(@purchase_shipping).to be_valid
      end
    end

    context '購入できない場合' do
      it 'post_codeが空では購入できない' do
        @purchase_shipping.post_code = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Post code can't be blank", "Post code は3桁ハイフン4桁の半角文字列で入力してください")
      end
      it 'post_codeは全角では購入できない' do
        @purchase_shipping.post_code = '１２３４５６７'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Post code は3桁ハイフン4桁の半角文字列で入力してください")
      end
        it 'prefecture_idが空では購入できない' do
        @purchase_shipping.prefecture_id = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県に「---」が選択されている場合は購入できない' do
        @purchase_shipping.prefecture_id = 1
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では購入できない' do
        @purchase_shipping.city = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("City can't be blank")
      end
        it 'streetが空では購入できない' do
        @purchase_shipping.street = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Street can't be blank")
      end
      it 'tel_numberが空では購入できない' do
        @purchase_shipping.tel_number = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Tel number can't be blank")
      end
      it 'tel_numberにハイフンが含まれている場合は購入できない' do
        @purchase_shipping.tel_number = '080-4141-6494'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Tel number はハイフン抜きで半角数値で入力してください')
      end
      it 'tel_numberが全角の場合は購入できない' do
        @purchase_shipping.tel_number = '０８０４１４１６４９４'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Tel number はハイフン抜きで半角数値で入力してください')
      end
      it 'userが紐付いていないと保存できない' do
        @purchase_shipping.user_id = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できない' do
        @purchase_shipping.item_id = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
