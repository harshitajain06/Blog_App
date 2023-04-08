class PostsController < ApplicationController
  def index
    @posts = Post.where(author_id: params[:user_id])
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
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
    if @post.save
      @post.update_post_counter
      flash[:notice] = 'Your post was created successfully'
      redirect_to user_path(@user)
    else
      flash.alert = 'sorry, something went wrong!'
      render :new
    end
  end
end
