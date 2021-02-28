class BuysController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    @buy = Buy.new
  end

  def create
    #buy = Buy.new(buy_params)
  end


  private

  def buy_params
    # params.require(:buy).permit(:pice)
     # :postal_code, :delivery_source_area_id, :municipality,  :address, :building_name, :phone_number).merge(user_id: current_user.id)
  end
end
