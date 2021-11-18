class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @users = User.all
    @posts = @user.posts.order(created_at: :desc)
  end

  def json
    @all_posts = Post.all
    json_response(@all_posts)
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
    new_post = Post.create(title: post_params[:title], text: post_params[:text], author_id: current_user.id)
    respond_to do |format|
      format.html do
        if new_post.save
          flash[:notice] = 'Post successfully created'
          redirect_to "/users/#{new_post.author_id}/posts/#{new_post.id}"
        else
          flash[:notice] = 'It was not possible to save the post'
          redirect_to '/posts/new'
        end
      end
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    placeholder = @post.author_id
    @post.delete
    flash[:notice] = 'Post successfully deleted'
    redirect_to "/users/#{placeholder}/posts"
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
