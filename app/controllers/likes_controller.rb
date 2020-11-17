class LikesController < ApplicationController
  def save_like
    @like = Like.new(post_id: params[:post_id], user_id: current_user.id)
    @post_id = params[:post_id]
    existing_like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    respond_to do |format|
      format.js {
        if existing_like
          existing_like.destroy
          @success = false
        elsif @like.save
          @success = true
        else
          @success = false
        end
        @post_likes = Post.find(@post_id).total_likes
        render "posts/like"
      }
    end
  end

  def list
    # get list of users who liked the post
    ids = Like.where(post_id: params[:id]).map { |i| i.user_id }
    @users = User.where(id: ids)
  end
end
