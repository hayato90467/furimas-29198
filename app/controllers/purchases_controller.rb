class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def index
    @items = Item.find(params[:item_id])
  end

  def new
    @purchase_address = PurchaseAddress.new
  end

  def create
    @items = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_address_params
    params.permit(:post, :prefectures_id, :city, :building, :address, :token, :mobile, :item_id, :user_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @items.price,
      card: purchase_address_params[:token],
      currency: 'jpy'
    )
  end
end
