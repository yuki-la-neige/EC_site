class Public::CartItemsController < ApplicationController
  def index
    @cart= CartItem.all
    @items = Item.all
  end

  def create
    @cart = CartItem.new(cart_item_params)
    @cart.save
    redirect_to public_cart_items_path
  end
  def update
    @cart = CartItem.find(params[:id])
    @cart.update
    redirect_to public_cart_items_path
  end
  def destroy
  end
  def destroy_all
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :end_user_id, :quantity)
  end
end
