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
      pay_item
      @buy_buyer.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy_buyer).permit(:postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number).merge(
      user_id: current_user.id, product_id: params[:product_id], token: params[:token]
    )
  end

  def move_to_index
    product = Product.find(params[:product_id])
    redirect_to root_path if product.user_id == current_user.id || !product.buy.nil?
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @product.price,   # 商品の値段
      card: buy_params[:token], # カードトークン
      currency: 'jpy'           # 通貨の種類（日本円）
    )
  end
end
