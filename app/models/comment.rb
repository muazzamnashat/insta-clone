class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates_presence_of :comment, :user_id, :post_id

  after_create :increase_post_comment_counter
  after_destroy :decrease_post_comment_counter

  private

  def increase_post_comment_counter
    Post.find(self.post_id).increment(:total_comments).save
  end

  def decrease_post_comment_counter
    Post.find(self.post_id).decrement(:total_comments).save
  end
end