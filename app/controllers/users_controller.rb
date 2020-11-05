class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:profile]

  def index
  end

  def profile
    @posts = @user.posts.active
  end

  def new
  end

  def create
  end

  private

  def set_user
    @user = User.find_by(username: params[:username])
  end
end
