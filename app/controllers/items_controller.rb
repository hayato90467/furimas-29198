class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:edit]
  # before_action :move_to_index, except: [:edit]
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

   def show
     @item = Item.find(params[:id])
   end

     def edit
     @item = Item.find(params[:id])
    flash[:notice] =  unless current_user
   
    # current_user  user_signed_in?
     current_user.update(item_params)
    end
   end

  def update
    @item = Tweet.find(params[:id])
    if current_user.update(item_params)
       redirect_to root_path
    else
      render :edit
    end
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end



   private

   def items_params
       params.require(:item).permit(:image, :name, :name_condition_id, :price, :name_description, 
       :name_category_id, :send_burden_id, :send_area_id, :send_day_id).merge(user_id: current_user.id)
   end
end