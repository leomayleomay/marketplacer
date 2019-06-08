class Product < ApplicationRecord
  validates :name, presence: true
  validates :uuid, uniqueness: true, presence: true
  validates :price_in_cents, presence: true, numericality: { only_integer: true, greater_than: 0 }
end