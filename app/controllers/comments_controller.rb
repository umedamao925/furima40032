class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @item = Item.find(params[:item_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      CommentChannel.broadcast_to @item, { comment: @comment, user: @comment.user } 
    end
  end

  def destroy
    @item = Item.find(params[:item_id])
    @comment = @item.comments.find(params[:id])
    @comment.destroy
    redirect_to request.referer
  end

  private
  def comment_params
  params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end