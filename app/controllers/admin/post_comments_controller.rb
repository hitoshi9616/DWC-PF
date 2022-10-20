class Admin::PostCommentsController < ApplicationController

  def index
    @post_comments = PostComment.all
  end

  def show
    @post_comment = PostComment.find(params[:id])
  end

  def destroy
    post_comment = PostComment.find(params[:id])
    post_comment.destroy
    redirect_to admin_post_comment_path
  end

end
