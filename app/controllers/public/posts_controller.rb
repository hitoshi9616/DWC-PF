class Public::PostsController < ApplicationController

  before_action :authenticate_customer!

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    if @post.save
      redirect_to post_path(@post.id)
    else
      @post = Post.new
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def confirm
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to customer_path(current_customer.id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :genre_id)
  end

end
