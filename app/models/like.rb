class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  after_save :update_like_count

  def update_like_count
    post.update(likes_counter: Like.where(posts_id:).count)
  end
end
