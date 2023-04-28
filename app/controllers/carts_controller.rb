class CartsController < ApplicationController

  def show
    @cart = current_cart
    @total_items = @cart.line_items.sum(:quantity)
  end

end
  