class LikesController < ApplicationController
  def save_like
    @post_id = params[:post_id]
    @like = Like.new(post_id: @post_id, user: current_user)
    existing_like = current_user.post_like(@post_id)
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

  def new
    @like.save
  end

  def delete
    @like.destroy
  end

  def list
    # get list of users who liked the post
    # @users = User.join(:likes).where(likes: { post_id: params[:id] } )
    # Created a model method
    @users = User.all_liking_post(params[:id])
  end
end
