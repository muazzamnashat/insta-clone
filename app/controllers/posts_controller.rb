class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    #dashboard- load all the posts
    @posts = Post.active

    #list of ids already followed by the current user
    following_ids = Follower.where(follower_id: current_user.id).map(&:following_id)

    #add current_user id to the list to make sure current_user does not show up on the suggestions
    following_ids << current_user.id

    @followers_suggestions = User.where.not(id: following_ids)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user if user_signed_in?
    if @post.save
      redirect_to posts_path, flash: { success: "Post was created successfully!" }
    else
      redirect_to new_post_path, flash: { danger: "Post was not saved!" }
    end
  end

  def show
  end

  def delete
  end

  def update
  end

  private

  def post_params
    params.require(:post).permit(:image, :image_cache, :description)
  end
end
