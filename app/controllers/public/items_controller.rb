class Public::ItemsController < ApplicationController

  before_action :authenticate_customer!

  def index
    @items = Item.all.order('updated_at DESC')
  end

  def show
    @item = Item.find(params[:id])
    @reviews = Review.where(item_id: @item.id).order('updated_at DESC')
    @review = Review.new
  end

end
