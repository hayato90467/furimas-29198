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
     return redirect_to root_path
   else
     render 'index'
   end
 end

 private

  def purchase_address_params
   params.permit(:post, :prefecture_id, :city, :post, :building, :address, :mobile, :token)
  end

 def pay_item
   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
   Payjp::Charge.create(
     amount: purchase_address_params[:price],
     card: purchase_address_params[:token],
     currency:'jpy'
   )
  end
end
