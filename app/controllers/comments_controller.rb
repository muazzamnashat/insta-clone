class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user if user_signed_in?
    if @comment.save
      redirect_to posts_path
    else
      redirect_to new_post_path, flash: { danger: "Post was not saved!" }
    end
  end

  def destroy
  end

  def update
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :post_id)
  end
end
