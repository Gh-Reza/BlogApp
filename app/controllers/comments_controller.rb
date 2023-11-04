class CommentsController < ApplicationController
  def new
    @comment = Comment.new# frozen_string_literal: true
    @post = Post.find(params[:id])
  end

  def create
    @current_user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new(user_id: @current_user.id, post_id: @post.id, text: params[:comment])
    if @comment.save
      redirect_to "/users/#{@current_user.id}/posts/#{@post.id}"
    end
  end
end

