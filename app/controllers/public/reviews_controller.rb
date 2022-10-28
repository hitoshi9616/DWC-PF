class Public::ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
    @review_comment = ReviewComment.new
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

  def edit
    @review = Review.find(params[:id])
  end

  def update
    review = Review.find(params[:id])
    if review.update(review_params)
      redirect_to review_path(review)
    else
      render :edit
    end
  end

  def confirm
    @review = Review.find(params[:id])
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
