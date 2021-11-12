class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_post_likes
    likes_counter = post.likes.count
    post.update(likes_counter: likes_counter)
  end
end
