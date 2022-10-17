class Admin::PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def confirm
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    customer_id = @post.customer_id
    @post.destroy
    redirect_to admin_customer_path(customer_id)
  end

end
