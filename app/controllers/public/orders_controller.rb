class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = Address.new
    @user = current_end_user
  end
  def new_confirmation
  end
  def completion
  end
  def create
    @order = Order.new(order_params)
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
