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
    @order.order_items.each do |item|
      item.status = params[:item_status]
      if item.status == "producing"
        @order.status = "producing"
      elsif @order.status == "confirmation"
        item.status = "waiting"
      end
      item.save
    end
    unless @order.order_items.where.not(status: "done").presence
        @order.status = "preparation"
    end
    @order.save
    redirect_to admin_order_path(@order)
  end
end
