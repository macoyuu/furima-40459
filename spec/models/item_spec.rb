require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品機能' do
    context '出品できる場合' do
      it 'item_name、item_explanation、item_category_id、item_condition_id、shipping_fee_id、prefecture_id、shipping_day_id、item_priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_explanationが空では登録できない' do
        @item.item_explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item explanation can't be blank")
      end
      it 'item_category_idが空では登録できない' do
        @item.item_category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.item_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      it 'item_condition_idが空では登録できない' do
        @item.item_condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end
      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end
      it 'shipping_fee_idが空では登録できない' do
        @item.shipping_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end
      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'shipping_day_idが空では登録できない' do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it 'item_priceが空では登録できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end
      it 'item_priceが空では登録できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is invalid')
      end
      it '価格に半角数字以外が含まれている場合は出品できない（※半角数字以外が一文字でも含まれていれば良い）' do
        @item.item_price = '300あ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is invalid')
      end
      it '価格が300円未満では出品できない' do
        @item.item_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is invalid')
      end
      it '価格が9_999_999円を超えると出品できない' do
        @item.item_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is invalid')
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
