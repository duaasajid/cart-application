class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user = User.last
    @order.cart = current_cart

    if @order.save
      session[:cart] = nil
      flash[:success] = "Order placed successfully!"
      redirect_to @order
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :shipping_address, :phone_number, :payment_method, :cart_id, :user_id)
  end
end
  