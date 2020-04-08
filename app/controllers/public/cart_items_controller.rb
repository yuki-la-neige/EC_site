class Public::CartItemsController < ApplicationController
  def index
    @user = current_end_user
    @carts= @user.cart_items
    @cart = CartItem.new
  end

  def create
    @cart = current_end_user.cart_items.new(cart_item_params)
    if @cart.save
      flash[:notice] = "Quantity was successfully created"
      redirect_to public_end_user_cart_items_path
    else
      @user = current_end_user
      @carts= @user.cart_items
      render "items/show(params[:item_id])"
    end
  end
  def update
    @cart = CartItem.find(params[:id])
    if @cart.update(cart_item_params)
      flash[:notice] = "Quantity was successfully updated"
      redirect_to public_end_user_cart_items_path
    else
      @user = current_end_user
      @carts= @user.cart_items
      render :index
    end
  end
  def destroy
    @cart = CartItem.find(params[:id])
    @cart.destroy
    redirect_to public_end_user_cart_items_path
  end
  def destroy_all
    @carts = current_end_user.cart_items
    @carts.destroy_all
    redirect_to public_end_user_cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:quantity, :item_id)
  end
end
