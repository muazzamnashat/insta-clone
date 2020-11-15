class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:profile]

  def profile
    # binding.pry
    @posts = Post.where(user_id: @user.id)
  end

  def follow_account
    following_id = params[:follow_id]
    follow = Follower.new(follower_id: current_user.id, following_id: following_id)
    followee = User.find(following_id)
    redirect_to posts_path
  end

  private

  def set_user
    @user = User.find_by(username: params[:username])
  end
end
