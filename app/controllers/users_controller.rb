class UsersController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_user, only: [:likes]

  def likes
    likes = Like.where(user_id: @user.id).pluck(:item_id)
    @like_items = Item.where(id: likes)
    @like_counts = @like_items.map { |item| Like.where(item_id: item.id).count }.sum
  end
  
  private
    def set_user
      @user = User.find(params[:id])
    end

end

