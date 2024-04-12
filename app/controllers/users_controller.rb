class UsersController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_user, only: [:likes]

  def likes
    likes = Like.where(user_id: @user.id).pluck(:item_id)
    @like_items = current_user.likes.map(&:item)
    @like_counts = Like.where(item_id: @like_items).count
  end
  
  private
    def set_user
      @user = User.find(params[:id])
    end

end

