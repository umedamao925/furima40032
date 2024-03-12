class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:edit, :show, :update]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end
  
  def edit
    if current_user.id != @item.user_id || @item.order != nil 
      redirect_to root_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end



  def update
    if @item.update(item_params)
    redirect_to item_path(@item.id)
  else
    render :edit, status: :unprocessable_entity 
  end
end

  

  private
  def item_params
    params.require(:item).permit(:item_name, :explain, :category_id, :condition_id, :cost_bearer_id, :shipping_area_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
   end

  

end
