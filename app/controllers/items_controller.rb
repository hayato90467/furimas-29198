class ItemsController < ApplicationController
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item =  Item.new
  end

  def create
    @item =  Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def items_params
    params.require(:item).permit(:image, :name, :name_condition_id, :price, :name_description, 
      :name_category_id, :send_burden_id, :send_area_id, :send_day_id).merge(user_id: current_user.id)
  end
end
