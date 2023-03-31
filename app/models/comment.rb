class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  after_save :update_comment_count

  def update_comment_count
    post.update(comment_count: Comment.where(posts_id:).count)
  end
end
