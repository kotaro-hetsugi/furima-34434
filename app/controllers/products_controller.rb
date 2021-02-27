class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update]
  before_action :set_product, only: [:show, :update, :edit]
  before_action :move_to_index, only: [:edit, :update]

  def index
    @products = Product.includes(:user).order('created_at desc')
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new(product_params)
    if product.save
      redirect_to root_path
    else
      @product = Product.create(product_params)
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product.id)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def product_params
    params.require(:product).permit(:image, :title, :text, :category_id, :status_id, :delivery_fee_role_id,
                                    :delivery_source_area_id, :delivery_days_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless @product.user_id == current_user.id
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
