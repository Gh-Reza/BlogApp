class CommentsController < ApplicationController
  def create
    @current_user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new(user_id: @current_user.id, post_id: @post.id, text: params[:comment])
    return unless @comment.save

    redirect_to "/users/#{@current_user.id}/posts/#{@post.id}"
  end
end
