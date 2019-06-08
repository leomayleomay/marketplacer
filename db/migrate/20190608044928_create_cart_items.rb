class CreateCartItems < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_items do |t|
      t.belongs_to :product, null: false, foreign_key: true
      t.integer :price_in_cents, null: false
      t.integer :qty, null: false, default: 1

      t.timestamps
    end
  end
end
