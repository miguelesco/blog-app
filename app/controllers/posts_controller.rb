class PostsController < ApplicationController
  def index; 
    @user = User.find(params[:user_id])
    @users = User.all
    @posts = @user.posts.order(created_at: :desc)
    @posts.each do |post|
      p post.more_recent_comments
    end
  end

  def show; end
end
