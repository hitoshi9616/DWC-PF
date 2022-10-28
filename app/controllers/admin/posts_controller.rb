class Admin::PostsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @posts = Post.all.order('created_at DESC')
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
