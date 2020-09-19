class ItemsController < ApplicationController
  # before_action :authenticate_user!, only: [:]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  # before_action :move_to_index, except: [:create]
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
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def update
    if @item.update(items_params)
      render :show
    else
      render :edit
    end
  end

  private

  def items_params
    params.require(:item).permit(:image, :name, :name_condition_id, :price, :name_description,
                                 :name_category_id, :send_burden_id, :send_area_id, :send_day_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end 
end
