class ProductsController < ApplicationController
  def index
    @products = Product.paginate(page: params[:page])
  end
end