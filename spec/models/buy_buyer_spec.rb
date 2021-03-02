require 'rails_helper'

RSpec.describe BuyBuyer, type: :model do
  before do
    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product)
    @buy_buyer = FactoryBot.build(:buy_buyer, user_id: user.id, product_id: product.id)
    sleep(0.1)
  end

  describe '商品購入機能' do
    context '購入できる時' do
      it '全ての項目が正しく存在すれば購入できる' do
        expect(@buy_buyer).to be_valid
      end
      it 'building_nameが空でも購入できる' do
        @buy_buyer.building_name = ''
        expect(@buy_buyer).to be_valid
      end
    end

    context '購入できない時' do
      it 'tokenが空では購入できない' do
        @buy_buyer.token = ''
        @buy_buyer.valid?
        expect(@buy_buyer.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空では購入できない' do
        @buy_buyer.postal_code = ''
        @buy_buyer.valid?
        expect(@buy_buyer.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeがハイフン無しでは購入できない' do
        @buy_buyer.postal_code = '1111111'
        @buy_buyer.valid?
        expect(@buy_buyer.errors.full_messages).to include('Postal code Input correctly')
      end
      it 'postal_codeが所定箇所以外のハイフンでは購入できない' do
        @buy_buyer.postal_code = '11-11111'
        @buy_buyer.valid?
        expect(@buy_buyer.errors.full_messages).to include('Postal code Input correctly')
      end
      it 'postal_codeが全角数字では購入できない' do
        @buy_buyer.postal_code = '１１１−１１１１'  # 全角
        @buy_buyer.valid?
        expect(@buy_buyer.errors.full_messages).to include('Postal code Input correctly')
      end
      it 'prefectures_idが1では購入できない' do
        @buy_buyer.prefectures_id = 1
        @buy_buyer.valid?
        expect(@buy_buyer.errors.full_messages).to include('Prefectures Select')
      end
      it 'municipalityが空では購入できない' do
        @buy_buyer.municipality = ''
        @buy_buyer.valid?
        expect(@buy_buyer.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空では購入できない' do
        @buy_buyer.address = ''
        @buy_buyer.valid?
        expect(@buy_buyer.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @buy_buyer.phone_number = ''
        @buy_buyer.valid?
        expect(@buy_buyer.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが全角文字では購入できない' do
        @buy_buyer.phone_number = '１１１２２２２３３３３'  # 全角
        @buy_buyer.valid?
        expect(@buy_buyer.errors.full_messages).to include('Phone number Input only number')
      end
      it 'phone_numberが半角英数字混合では購入できない' do
        @buy_buyer.phone_number = '111aaaa3333'
        @buy_buyer.valid?
        expect(@buy_buyer.errors.full_messages).to include('Phone number Input only number')
      end
      it 'phone_numberが半角英字のみでは購入できない' do
        @buy_buyer.phone_number = 'aaabbbbcccc'
        @buy_buyer.valid?
        expect(@buy_buyer.errors.full_messages).to include('Phone number Input only number')
      end
      it 'phone_numberが12桁以上では購入できない' do
        @buy_buyer.phone_number = '111222233334'
        @buy_buyer.valid?
        expect(@buy_buyer.errors.full_messages).to include('Phone number Input only number')
      end
      it 'user_idがnilの場合、購入できない' do
        @buy_buyer.user_id = nil
        @buy_buyer.valid?
        expect(@buy_buyer.errors.full_messages).to include("User can't be blank")
      end
      it 'product_idがnilの場合、購入できない' do
        @buy_buyer.product_id = nil
        @buy_buyer.valid?
        expect(@buy_buyer.errors.full_messages).to include("Product can't be blank")
      end
    end
  end
end
