class Like < ApplicationRecord
    belongs_to :author, class_name: 'User'
    belongs_to :post, class_name: 'Post'

    after_save :update_like_count

  def update_like_count
    post.update(like_count: Like.where(post_id:).count)
  end

    
end
