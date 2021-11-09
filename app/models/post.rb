class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def update_post_counter
    post_count = user.posts.count
    user.update(posts_counter: post_count)
  end

  def more_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
