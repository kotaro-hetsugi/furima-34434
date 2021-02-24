class ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.create(product_params)
    if product.save
      redirect_to root_path
    else
      @product = Product.create(product_params)
      render :new
    end
  end


  private
  
  def product_params
    params.require(:product).permit(:image, :title, :text, :category_id, :status_id, :delivery_fee_role_id, :delivery_source_area_id, :delivery_days_id, :price).merge(user_id:current_user.id)
  end
end
