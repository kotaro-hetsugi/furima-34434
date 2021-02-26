class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @products = Product.includes(:user)
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new(product_params)
    if product.save
      redirect_to root_path
    else
      @product = Product.new(product_params)
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :title, :text, :category_id, :status_id, :delivery_fee_role_id,
                                    :delivery_source_area_id, :delivery_days_id, :price).merge(user_id: current_user.id)
  end
end
