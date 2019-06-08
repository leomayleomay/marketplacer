class CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.includes(:product)
    
    @discounted_total = DiscountedTotal.new(@cart_items)
  end

  def create
    @cart_item = AddToCart.new(cart_item_params).execute

    if @cart_item.save
      redirect_to '/', notice: 'New item added to cart'
    else
      redirect_to :back, alert: @cart_item.errors.full_messages.to_sentence
    end
  end
  
  protected
  
  def cart_item_params
    params.require(:cart_item).permit(:product_id, :price_in_cents)
  end
end