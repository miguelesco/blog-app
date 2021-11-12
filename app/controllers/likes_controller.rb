class LikesController < ApplicationController
  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @like = @user.likes.build(post_id: @post.id, author_id: @user.id)
    p @like
    if @like.save
      flash[:alert] = 'Like Set'
      @like.update_post_likes
      redirect_to user_post_path(@user.id, @post)
    else
      p ' error'
    end
  end
end
