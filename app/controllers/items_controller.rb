class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  #def move_to_index
   # @item = Item.find(params[:id])
    #unless user_signed_in? && current_user.id == @item.user_id
      #redirect_to action: :index
    #end
  #end

  def index
    #@items = Item.all
  end

  def new
    @item = Item.new
  end

  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  #def show
  #end

  private
 
  def item_params
    params.require(:item).permit(:item_name, :explain, :category_id, :condition_id, :cost_bearer_id, :shipping_area_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end

end
