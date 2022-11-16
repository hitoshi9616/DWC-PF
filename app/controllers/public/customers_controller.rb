class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!

  def index
    @customers = Customer.all.order('created_at DESC')
  end

  def show
    @customer = Customer.find(params[:id])
    @reviews = Review.where(customer_id: @customer.id).order('updated_at DESC').limit(1)
    @posts = Post.where(customer_id: @customer.id).order('created_at DESC').limit(1)
    @genres = Genre.all
  end

  def edit
    if current_customer.email != 'guest@example.com'
      @customer = Customer.find(params[:id])
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.id == current_customer.id
      if @customer.update(customer_params)
        redirect_to customer_path(@customer.id)
      else
        render :edit
      end
    else
      redirect_to customers_path
    end
  end

  def review
    @customer = Customer.find(params[:id])
    @reviews = Review.where(customer_id: @customer.id).order('updated_at DESC')
  end

  def post
    @customer = Customer.find(params[:id])
    @posts = Post.where(customer_id: @customer.id).order('created_at DESC')
  end


  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :nickname, :phone_number, :age, :email)
  end

end
