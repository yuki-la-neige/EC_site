class Admin::OrderItemsController < ApplicationController
  def update
    order_item = OrderItem.find(params[:id])
    order_item.update(status: params[:item_status])
    if order_item.status == "producing"
      order_item.order.status = "producing"
      order_item.order.save
    end

    order_item.order.order_items.each_with_index do |order_item, index|
      unless order_item.status == "done"
        break
      end
      puts index
      puts order_item.order.order_items.size - 1
      if index == order_item.order.order_items.size - 1
        order = Order.find(order_item.order.id)
        order.update(status: "preparation")
        puts "-----------------------------------"
      end
    end

    redirect_to admin_orders_path
  end
end
