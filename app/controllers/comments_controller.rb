class CommentsController < ApplicationController
  def create
    @user = current_user
    @user = User.find(params[:user_id])
    @comment = current_user.comments.create(text: comment_params[:text], post_id: params[:post_id])
    if @comment.save
      flash.now[:notice] = 'Comment successfully saved'
      @comment.update_post_counter
      redirect_to user_post_path(@user.id, Post.find(params[:post_id]))
    else
      render :new
    end
  end

  def json
    @comments = Post.find(params[:id]).comments

    json_response(@comments)
  end

  def json_create
    comment = Post.find(params[:id]).comments.create(text:params[:text], author_id:params[:user])
    if comment.save
      json_response({
        success: 'Comment successfully created'
      })
    end
    p comment
  end

  def comment_params
    params.require(:comment).permit(:text)
  end

  def destroy
    @comment = Comment.find(params[:id])
    author = params[:user_id]
    post = @comment.post_id
    @comment.delete
    flash[:notice] = 'Comment successfully deleted'
    redirect_to "/users/#{author}/posts/#{post}"
  end
end
