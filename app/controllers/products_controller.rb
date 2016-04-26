class ProductsController < ApplicationController

  def results
    @products = BestBuyService.new()
  end
end
