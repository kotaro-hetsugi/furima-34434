require 'rails_helper'

RSpec.describe BuyBuyer, type: :model do
  before do
    @buy_buyer = FactoryBot.build(:buy_buyer)
  end


  describe '商品購入機能' do
    context '購入できる時' do
      it '全ての項目が正しく存在すれば購入できる' do
       expect(@buy_buyer).to be_valid
      end
      it 'building_nameが空でも購入できる' do

      end
    end

    context '購入できない時' do
      it 'tokenが空では購入できない' do
      end
      it 'postal_codeが空では購入できない' do
      end
      it 'postal_codeが3桁-4桁(半角数字)以外では購入できない' do
      end
      it 'prefectures_idが1では購入できない' do
      end
      it 'municipalityが空では購入できない' do
      end
      it 'addressが空では購入できない' do
      end
      it 'phone_numberが空では購入できない' do
      end
      it 'phone_numberが全角文字では購入できない' do
      end
      it 'phone_numberが半角英数字混合では購入できない' do
      end
      it 'phone_numberが半角英字のみでは購入できない' do
      end
    end
  end

end
