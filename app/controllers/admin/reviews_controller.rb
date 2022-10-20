class Admin::ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def confirm
    @review = Review.find(params[:id])
  end

  def destroy
    @review = Review.find(params[:id])
    customer_id = @review.customer_id
    @review.destroy
    redirect_to admin_customer_path(customer_id)
  end

end
