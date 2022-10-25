class Public::CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
    @review = Review.find_by(customer_id: @customer.id)
    @post = Post.find_by(customer_id: @customer.id)
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
      render edit_customer_path(@customer.id)
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:nickname)
  end

end
