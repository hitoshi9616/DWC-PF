class Admin::ReviewCommentsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @review_comments = ReviewComment.all.order('created_at DESC')
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
