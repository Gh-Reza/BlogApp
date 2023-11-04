class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def new; end

  def create
    @current_user = current_user
    @post = @current_user.posts.build(title: params[:title], text: params[:text], author: @current_user,
                                      comments_counter: 0, likes_counter: 0)

    if @post.save
      redirect_to "/users/#{@current_user.id}/posts" # Redirect to the post show page
    else
      render plain: @post.errors.full_messages
    end
  end
end
