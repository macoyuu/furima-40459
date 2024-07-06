class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
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
      @purchase_shipping.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase_shipping).permit(:post_code, :prefecture_id, :city, :street, :building, :tel_number, :purchase, :token).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
