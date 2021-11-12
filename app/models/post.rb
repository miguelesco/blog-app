class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  accepts_nested_attributes_for :comments, :likes

  def update_post_counter
    post_count = user.posts.count
    user.update(posts_counter: post_count)
  end

  def more_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
