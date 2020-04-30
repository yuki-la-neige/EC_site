class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all.order(id: "DESC")
  end
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items

  end
  def update
    @order = Order.find(params[:id])
    @order.status = params[:status]
    @order.save
    if @order.status == "confirmation"
      @order.order_items.each do |order_item|
        order_item.update(status: "waiting")
      end
    end
    redirect_to admin_order_path(@order)
  end
end
