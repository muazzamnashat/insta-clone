class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook]

  validates_presence_of :email, :username
  validates_uniqueness_of :email, :username

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :posts, through: :comments
  has_many :followers, class_name: :Follower, foreign_key: :following_id, dependent: :destroy
  has_many :followings, class_name: :Follower, foreign_key: :follower_id, dependent: :destroy

  mount_uploader :image, ImageUploader

  def self.from_omniauth(auth)
    # binding.pry
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.first_name = auth.info.name.split(" ").first
      user.last_name = auth.info.name.split(" ").last
      user.username = auth.info.name.gsub(" ", "")
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  # def total_followers
  #   0
  # end

  # def total_following
  #   0
  # end
end
