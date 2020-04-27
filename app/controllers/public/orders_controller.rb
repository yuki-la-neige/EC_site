class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @user = current_end_user
    @addresses = Address.where(end_user_id: current_end_user)
  end
  def new_confirmation
    @items = current_end_user.cart_items
  end
  def completion
    order = Order.new(session[:order])
    cart_items = current_end_user.cart_items
    order.save
    cart_items.each do |cart|
      order_item = OrderItem.new
      order_item.order_id = order.id
      order_item.item_id = cart.item.id
      order_item.quantity = cart.quantity
      order_item.price_at = cart.item.price
      order_item.status = 0
      order_item.save
     end
     cart_items.destroy_all
  end
  def create
    session[:order] = Order.new
    session[:payments] = params[:payment_option]
    session[:address_select] = params[:select]
    session[:order][:end_user_id] = current_end_user.id
    session[:order][:postage] = 800
    session[:order][:status] = 0
     if session[:payments] == "0"
      session[:order][:payment_method] = 0
    elsif session[:payments] == "1"
      session[:order][:payment_method] = 1
    end
    if session[:address_select] == "myaddress"
      session[:order][:delivery_postal_code] = current_end_user.postal_code
      session[:order][:delivery_address] = current_end_user.address
      session[:order][:delivery_name] = current_end_user.family_name + current_end_user.first_name
    elsif session[:address_select] == "registered_address"
      address_collection = params[:address_collection]
      address = Address.find(address_collection)
      session[:order][:delivery_postal_code] = address.postal_code
      session[:order][:delivery_address] = address.address
      session[:order][:delivery_name] = address.name
    elsif session[:address_select] == "new_address"
      session[:order][:delivery_postal_code] = params[:new_postal_code]
      session[:order][:delivery_address] = params[:new_delivery_address]
      session[:order][:delivery_name] = params[:new_delivery_name]
    end
    cart_items = current_end_user.cart_items
    sum = 0
    cart_items.each do |f|
      item = f.item
      sum += item.price * f.quantity
    end
    session[:order][:payment_amount] = sum
    redirect_to  public_order_new_confirmation_path
  end
  def index
  end
  def show
  end

  private
  def order_params
    params.require(:order).permit(:end_user_id, :payment_method, :postage, :payment_amount, :status, :delivery_postal_code, :delivery_address, :delivery_name)
  end
end
