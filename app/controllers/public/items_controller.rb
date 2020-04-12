class Public::ItemsController < ApplicationController
  def index
    @items = Item.where(status: "true")
    @genres = Genre.all
  end
  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @user = current_end_user
    @cart = CartItem.new
  end
end
