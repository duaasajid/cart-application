class LineItemsController < ApplicationController
  def create
    product = Product.find(params[:line_item][:product_id])  
    cart = current_cart

    line_item = cart&.line_items&.find_by(product_id: product.id)
  
    if line_item
      line_item.quantity += 1
      line_item.total_price = line_item.quantity * line_item.product.price
    else
      line_item = cart.line_items.build(product: product, quantity: 1, total_price: product.price)
    end
    line_item.save!
    redirect_to cart_path(cart)
  end

  def update
    @line_item = LineItem.find(params[:id])
    @line_item.update(line_item_params)
    render json: { total_price: @line_item.total_price, line_item: @line_item }
  end    

  def destroy
    @line_item = LineItem.find(params[:id])
    if @line_item.quantity > 1
      @line_item.quantity -= 1
      @line_item.save
    else
      @line_item.destroy
    end
    respond_to do |format|
      format.html { redirect_to cart_path }
      format.json { render json: { total_price: current_cart.total_price } }
    end
  end    

  private

  def line_item_params
    params.require(:line_item).permit(:quantity)
  end
    
end
  