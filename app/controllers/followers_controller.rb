class FollowersController < ApplicationController

  # get a followers list for a particle user
  def followers_list
    ids = User.find_by_id(params[:id]).followers.map { |i| i.follower_id }
    @users = User.where(id: ids)
  end

  def following_list
    # binding.pry
    ids = User.find_by_id(params[:id]).followings.map { |i| i.following_id }
    @users = User.where(id: ids)
  end
end
