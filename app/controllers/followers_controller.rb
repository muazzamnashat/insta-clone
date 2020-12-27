class FollowersController < ApplicationController

  # get a followers list for a particle user
  def followers_list
    @users = User.find(params[:id]).followers
  end

  def following_list
    @users = User.find(params[:id]).followings
  end
end
