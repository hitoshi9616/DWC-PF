class Public::ReviewsController < ApplicationController

  before_action :authenticate_customer!

  def new
    if current_customer.email != 'guest@example.com'
      @review = Review.new
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def create
    @review = Review.new(review_params)
    @review.customer_id = current_customer.id
    if @review.save
      redirect_to item_path(@review.item_id)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def index
    @reviews = Review.all.order('updated_at DESC')
  end

  def show
    @review = Review.find(params[:id])
    @review_comment = ReviewComment.new
  end

  def edit
    if current_customer.email != 'guest@example.com'
      @review = Review.find(params[:id])
      if @review.customer_id == current_customer.id
      else
        redirect_to reviews_path
      end
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    review = Review.find(params[:id])
    if review.customer_id == current_customer.id
      review.update(review_params)
      redirect_to review_path(review)
    else
      render :edit
    end
  end

  def confirm
    if current_customer.email != 'guest@example.com'
      @review = Review.find(params[:id])
      if @review.customer_id == current_customer.id
      else
        redirect_to reviews_path
      end
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to customer_path(current_customer.id)
  end

  private

  def review_params
    params.require(:review).permit(:item_id, :evaluation, :title, :text)
  end

end
