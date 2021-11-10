class UsersController < ApplicationController
  def index;
    @users =  User.all
  end

  def show;
    @user = User.find(params[:id])
    @posts = Post.joins(:author_id).where(author_id: params[:id])
    p params[:id]
    p @posts
  end
end
