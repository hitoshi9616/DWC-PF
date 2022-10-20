class Admin::ReviewCommentsController < ApplicationController

  def index
    @review_comments = ReviewComment.all
  end

  def show
    @review_comment = ReviewComment.find(params[:id])
  end

  def destroy
    @review_comment = ReviewComment.find(params[:id])
    @review_comment.destroy
    redirect_to admin_reviews_comments_path
  end

end
