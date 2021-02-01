class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @item_purchase = ItemPurchase.new
    redirect_to root_path if current_user.id == @item.user_id || @item.purchase != nil
  end

  def create
    @item = Item.find(params[:item_id])
    @item_purchase = ItemPurchase.new(purchase_params)
    if @item_purchase.valid?
      @item_purchase.save
      pay_item
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render action: :index
    end
  end

  private

  def purchase_params
    params.require(:item_purchase).permit(:postcode, :prefecture_id, :city, :block, :building, :phone, :purchase_id).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item[:value],
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
