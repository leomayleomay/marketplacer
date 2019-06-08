class AddToCart
  def initialize(params)
    @params = params
    
    @cart_item = nil
  end
  
  def execute
    if @cart_item = CartItem.find_by(@params.slice(:product_id))
      @cart_item.qty += 1
    else
      @cart_item = CartItem.new(@params)
    end

    @cart_item
  end
end