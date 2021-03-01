class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @product = Product.find(params[:product_id])
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
    params.require(:buy_buyer).permit(:postal_code, :prefectures_id, :municipality,  :address, :building_name, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def move_to_index
    product = Product.find(params[:product_id])
    unless product.user_id != current_user.id
      redirect_to root_path
    end
  end

end
