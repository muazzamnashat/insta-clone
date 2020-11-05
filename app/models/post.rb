class Post < ApplicationRecord
  default_scope { order created_at: :desc }
  mount_uploader :image, ImageUploader
  before_create :set_active

  belongs_to :user
  has_many :likes

  scope :active, -> { where active: true }

  def total_likes
    0
  end

  def set_active
    self.active = true
  end
end
