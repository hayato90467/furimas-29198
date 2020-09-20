class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :curent_user, only: [:index, :new]
  before_action :set_purchases, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
  end

  def new
    @purchase_address = PurchaseAddress.new
  end

  def create
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

   def curent_user
     @item = Item.find(params[:item_id])
     redirect_to root_path if @item.user_id == current_user.id || !@item.purchase.nil?
   end

  def purchase_address_params
    params.permit(:post, :prefectures_id, :city, :building, :address, :token, :mobile, :item_id,).merge(user_id: current_user.id)
  end

  def set_purchases
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_address_params[:token],
      currency: 'jpy'
    )
  end
end
