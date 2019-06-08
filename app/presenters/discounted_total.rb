class DiscountedTotal
  attr_accessor :discounted_text, :discounted_total_in_cents

  def initialize(cart_items)
    total_in_cents = cart_items.sum(&:sub_total_in_cents)
    
    if rule = DISCOUNT_RULES.detect { |r| total_in_cents > r['cents'].to_i } 
      @discounted_text = rule['text']

      @discounted_total_in_cents = (1 - rule['discount'].to_f) * total_in_cents
    end
  end
end