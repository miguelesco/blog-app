class Comment < AplicationRecord
  belongs_to :user
  belongs_to :post

  def update_post_counter
    comment_count = post.comments.count
    post.update(comments_counter: comment_count)
  end
end