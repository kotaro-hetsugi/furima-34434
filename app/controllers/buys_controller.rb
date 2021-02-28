class BuysController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    #@buy = Buy.new
    @buy_buyer = BuyBuyer.new
  end

  def create
    @buy_buyer = BuyBuyer.new(buy_params)
    @product = Product.find(params[:product_id])
    if @buy_buyer.valid?
      @buy_buyer.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def buy_params
    params.require(:buy_buyer).permit(:postal_code, :prefectures_id, :municipality,  :address, :building_name, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id])
  end

end
