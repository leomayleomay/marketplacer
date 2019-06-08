class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :uuid, null: false
      t.string :name, null: false
      t.integer :price_in_cents, null: false

      t.timestamps
    end

    add_index :products, :uuid, unique: true
  end
end
