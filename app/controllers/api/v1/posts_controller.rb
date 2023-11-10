class Api::V1::PostsController < ApplicationController
  def index
    @user = current_user
    @posts = Post.where(author_id: @user.id)
    render json: @posts
  end
end
