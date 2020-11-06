class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates_presence_of :comment, :user_id, :post_id
end
