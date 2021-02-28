class BuyBuyer
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number, :user_id, :product_id, :buy_id

  with_options presence: true do
    validates :postal_code
    validates :municipality
    validates :address
  end

  validates :prefectures_id, numericality: { other_than: 1 }
  validates :phone_number, numericality: { only_integer: true, message: 'Input only number' }

  def save
    buy = Buy.create(user_id: user_id, product_id: product_id)  # 購入情報を保存し、変数buyに代入する
    Buyer.create(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, buy_id: buy.id)     # 購入者住所を保存する   # buy_idには、変数buyのidと指定する
  end
end