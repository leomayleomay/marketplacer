# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  YAML.load_file(Rails.root.join("products.json")).each do |product|
    Product.find_or_initialize_by(product.slice('uuid')).tap do |p|
      p.name = product.fetch('name')
      p.price_in_cents = (product.fetch('price').to_f * 100).to_i
      p.save!
    end
  end
end