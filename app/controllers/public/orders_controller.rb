class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = current_customer.orders.new(order_params)
    @order.shipping_fee = 800

    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    end

    @cart_items = current_customer.cart_items
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.item_id = cart_item.item.id
      order_detail.order_id = @order.id
      order_detail.amount = cart_item.amount
      order_detail.price = cart_item.item.price
      order_detail.save
    end

    @cart_items.destroy_all
    redirect_to orders_complete_path

  end

  def complete
  end



  def index
    @orders = Order.all
    @order_details = OrderDetail.all
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:pay_method, :postal_code, :address, :name, :total_payment, :shipping_fee)
  end
end
