class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user = current_user
    @like = Like.new(author: @user, post: @post)
    @like.save

    if @like.save
      redirect_to user_post_path(@user, @post)
    else
      render :new
    end
  end
end
