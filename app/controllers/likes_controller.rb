class LikesController < ApplicationController
  #   before_action :authenticate_account!

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

        render "posts/like"
      }
    end
  end
end
