class Admin::ReviewsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @reviews = Review.all.order('updated_at DESC')
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
