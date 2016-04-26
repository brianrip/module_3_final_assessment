class ProductsController < ApplicationController

  def results
    @products = BestBuyService.new.products(params[:search][:keyword])
  end
end
