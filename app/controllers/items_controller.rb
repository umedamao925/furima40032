class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :login_item, only: [:edit, :destroy]

  def index
    @items = Item.all.order(created_at: :desc)
    if user_signed_in?
      @user = current_user
      likes = Like.where(user_id: @user.id).pluck(:item_id)
      @like_items = current_user.likes.map(&:item)
      @like_counts = Like.where(item_id: @like_items).count
    end
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
    @like = current_user.likes.find_by(item_id: @item.id)
    @comments = @item.comments.includes(:user)
    @comment = Comment.new
    @user = current_user
    if user_signed_in?
    likes = Like.where(user_id: @user.id).pluck(:item_id)
    @like_items = current_user.likes.map(&:item)
    @like_counts = Like.where(item_id: @like_items).count
  end
end


  def destroy
    @item.destroy
    redirect_to root_path
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


   def login_item
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end


end
