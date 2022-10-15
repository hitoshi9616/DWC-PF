class Public::ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_customer.id
    #@review.item_id = item.id
    if @review.save
      redirect_to review_path(@review.id)
    else
      render item_path(item.id)
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
    params.require(:review).permit(:evaluation, :text)
end
