class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_post_counter
    comment_count = post.comments.count
    post.update(comments_counter: comment_count)
  end
end
