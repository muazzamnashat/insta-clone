class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:profile]

  def index
  end

  def profile
    @posts = Post.where(user_id: current_user.id)
  end

  def new
  end

  def create
  end

  def follow_account
    following_id = params[:follow_id]
    follow = Follower.new(follower_id: current_user.id, following_id: following_id)
    followee = User.find(following_id)

    if follow.save
      flash[:success] = "Now following #{followee.username}"
    else
      flash[:danger] = "Unable to follow!"
    end
    redirect_to posts_path
  end

  private

  def set_user
    @user = User.find_by(username: params[:username])
  end
end
