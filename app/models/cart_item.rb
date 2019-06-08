class CartItem < ApplicationRecord
  belongs_to :product
  
  validates :qty, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :price_in_cents, presence: true, numericality: { only_integer: true, greater_than: 0 }

  def sub_total_in_cents
    price_in_cents * qty
  end
end