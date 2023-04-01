class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  after_save :update_comment_count

  def update_comment_count
    post.update(comments_counter: Comment.where(post_id:).count)
  end
end
