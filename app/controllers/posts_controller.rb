class PostsController < ApplicationController
  def index
    @posts = Post.where(author_id: params[:user_id])
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])
    @comments = @post.comments
    @likes = @post.likes
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @user = current_user
    @post = Post.new(author: @user, title: params[:post][:title], text: params[:post][:text])
    @post.save
    redirect_to user_path(@user)
  end
end
