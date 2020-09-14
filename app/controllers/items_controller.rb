class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :index]
  before_action :set_item, only: [:show, :edit, :update]
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item =  Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path if item.destroy
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  private

  def items_params
    params.require(:item).permit(:image, :name, :name_condition_id, :price, :name_description,
                                 :name_category_id, :send_burden_id, :send_area_id, :send_day_id).merge(user_id: current_user.id)
  end
end
