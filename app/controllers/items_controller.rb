class ItemsController < ApplicationController
  def index
    # @items = Items.order("created_at DESC")
  end
  def new
  #  @items =  Items.new
  end

  def create
    Items.create(create_params)
    @items =  Items.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new 
    end
  end

  private
  def  create_params
    params.require(:items).permit(:name, :image, :text).merge(user_id: current_user.id)
  end

  def items_params
    params.require(:items).permit(:title,:text,:genre_id)
  end
end
