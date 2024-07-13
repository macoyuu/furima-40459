class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
    @purchase_shipping = PurchaseShipping.new
    if current_user == @item.user || Purchase.exists?(item_id: @item.id)
      redirect_to root_path
      end
  end

  def create
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    @item = Item.find(params[:item_id]) 
    if @purchase_shipping.valid?
      pay_item
      @purchase_shipping.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase_shipping).permit(:post_code, :prefecture_id, :city, :street, :building, :tel_number, :purchase).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.item_price,  # 商品の値段
        card: purchase_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

end
