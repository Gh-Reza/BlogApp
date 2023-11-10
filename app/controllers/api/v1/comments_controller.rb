class Api::V1::CommentsController < ApplicationController
  def index
    @user = current_user
    @post = Post.includes(:author, :comments).find(params[:post_id])
    @comments = @post.comments
    render json: @comments
  end
end