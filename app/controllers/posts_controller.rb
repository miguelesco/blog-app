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
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    new_post = Post.create(title: params[:post][:title], text: params[:post][:text], author_id: current_user.id)
    respond_to do |format|
      format.html do
        if new_post.save
          flash[:notice] = 'Saved successfully'
          redirect_to "/users/#{new_post.author_id}/posts/#{new_post.id}"
        else
          flash[:error] = 'error'
          render :new
        end
      end
    end
  end
end
