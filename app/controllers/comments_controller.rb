class CommentsController < ApplicationController
  load_and_authorize_resource
  def create
    @user = current_user
    @comment = @user.comments.build(comment_params)
    @comment.author_id = @user.id
    @comment.post_id = params[:post_id]
    if @comment.save
      flash.now[:notice] = 'Comment successfully saved'
      @comment.update_post_counter
      redirect_to user_post_path(@user.id, Post.find(params[:post_id]))
    else
      render :new
    end
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
