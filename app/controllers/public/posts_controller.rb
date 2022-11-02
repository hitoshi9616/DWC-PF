class Public::PostsController < ApplicationController

  before_action :authenticate_customer!

  def new
    if current_customer.email != 'guest@example.com'
      @genres = Genre.all
      @post = Post.new
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    #@post.score = Language.get_data(post_params[:text])
    if @post.save
      redirect_to post_path(@post.id)
    else
      @post = Post.new
      render :new
    end
  end

  def index
    @posts = Post.all.order('created_at DESC')
    @genres = Genre.all
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def confirm
    if current_customer.email != 'guest@example.com'
      @post = Post.find(params[:id])
      if @post.customer_id == current_customer.id
      else
        redirect_to posts_path
      end
    else
      redirect_back(fallback_location: root_path)
    end
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
