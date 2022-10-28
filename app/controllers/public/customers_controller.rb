class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
    @reviews = Review.where(customer_id: @customer.id).order('updated_at DESC').limit(1)
    @posts = Post.where(customer_id: @customer.id).order('updated_at DESC').limit(1)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.id == current_customer.id
      @customer.update(customer_params)
      redirect_to customer_path(@customer.id)
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:nickname)
  end

end
