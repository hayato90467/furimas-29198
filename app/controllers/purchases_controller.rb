class PurchasesController < ApplicationController
 def index
 end

 def new
  @purchase_address = Purchase_address.new
 end

  def create
  @purchase_address = Purchase_address.new(purchase_address_params)
  @purchase_address.save
 end

 private

 def purchase_address_params
  params.require(:purchase_address).permit(:post, :prefecture_id :city, :post, :building, :address, :mobile, :price)
 end

end