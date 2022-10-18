class Public::ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = Review.new(review_params)
    @review.customer_id = current_customer.id
    @review.item_id = item.id
    if @review.save
      redirect_to review_path(@review.id)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
    @review = Review.find(params[:id])
    if review.update(review_params)
      redirect_to review_path(@review.id)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:evaluation, :text, :evaluation)
  end

end
