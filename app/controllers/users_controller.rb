class UsersController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_user, only: [:likes]

  def likes
    @item = Item.find(params[:item_id])
    likes = Like.where(user_id: @user.id).pluck(:item_id)
    @like_items = current_user.likes.map(&:item)
    @like_counts = @like_items.map { |item_id| Like.where(item_id: item_id).count }.sum
  end
  
  private
    def set_user
      @user = User.find(params[:id])
    end

end

