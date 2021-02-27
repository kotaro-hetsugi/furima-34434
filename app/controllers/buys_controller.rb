class BuysController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
  end

  def create

  end
end
