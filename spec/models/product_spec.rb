require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品機能' do
    context '商品出品ができる時' do
      it '全ての項目が正しく存在すれば出品できる' do
        expect(@product).to be_valid
      end
    end

    context '商品出品ができない時' do
      it 'imageが空では出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it 'titleが空では出品できない' do
        @product.title = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Title can't be blank")
      end
      it 'textが空では出品できない' do
        @product.text = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Text can't be blank")
      end
      it 'category_idが1では出品できない' do
        @product.category_id = "1"
        @product.valid?
        expect(@product.errors.full_messages).to include("Category must be other than 1")
      end
      it 'status_idが1では出品できない' do
        @product.status_id = "1"
        @product.valid?
        expect(@product.errors.full_messages).to include("Status must be other than 1")
      end
      it 'delivery_fee_role_idが1では出品できない' do
        @product.delivery_fee_role_id = "1"
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery fee role must be other than 1")
      end
      it 'delivery_source_area_idが1では出品できない' do
        @product.delivery_source_area_id = "1"
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery source area must be other than 1")
      end
      it 'delivery_days_idが1では出品できない' do
        @product.delivery_days_id = "1"
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery days must be other than 1")
      end
      it 'priceが空では出品できない' do
        @product.price = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Price Half-width number")
      end
      it 'priceが300未満では出品できない' do
        @product.price = "299"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price Out of setting range")
      end
      it 'priceが9,999,999より大きければ出品できない' do
        @product.price = "10000000"  #1000万
        @product.valid?
        expect(@product.errors.full_messages).to include("Price Out of setting range")
      end
      it 'priceが半角数字以外では出品できない' do
        @product.price = "３００" #全角
        @product.valid?
        expect(@product.errors.full_messages).to include("Price Half-width number")
      end
    end
  end

end
