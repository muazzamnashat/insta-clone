class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id if user_signed_in?
    if @comment.save
      # added this extra hidden return_to field only to the show page to make sure the comment request is goin from show page so we redirect user to same page
      return_url = params[:comment][:return_to].present? ? post_path(@comment.post_id) : posts_path
      redirect_to return_url, flash: { success: "Comment was created successfully!" }
    else
      redirect_to posts_path, flash: { danger: "Post was not saved!" }
    end
  end

  def destroy
  end

  def update
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :post_id, :return_to)
  end
end
