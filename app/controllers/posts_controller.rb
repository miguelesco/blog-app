class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @users = User.all
    @posts = @user.posts.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:user_id])
    @users = User.all
    @post = @user.posts.find(params[:id])
  end
end
