class LikesController < ApplicationController
  before_action :set_item

  def create
    @like = current_user.likes.build(item_id: params[:item_id])
    @like.save
    render partial: 'likes/like', locals: { item: @item }
  end
  
  def destroy
    @like = Like.find_by(item_id: params[:item_id], user_id: current_user.id)
    @like.destroy
    render partial: 'likes/likes', locals: { item: @item }
  end

  def set_item
    @item = Item.find(params[:item_id])
  end


  #def index
    #@user = User.find(params[:id])
    #@likes = Like.where(user_id: @user.id).pluck(:item_id)
    #@like_posts = Post.find(@likes)
 # end

  def likes_params
    params.require(:likes).merge(item_id: params[:item_id], user_id: current_user.id)
  end



end






