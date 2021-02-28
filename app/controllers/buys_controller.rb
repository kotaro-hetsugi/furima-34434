class BuysController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    @buy = Buy.new
  end

  def create
    @buy = Buy.create(buy_params)
    Buyer.create(buyer_params)
    redirect_to root_path
  end


  private

  def buy_params
    params.merge(user_id: current_user.id)
  end

  def buyer_params
    params.permit(:postal_code, :delivery_source_area_id, :municipality,  :address, :building_name, :phone_number).merge(buy_id: @buy.id)
  end
end
