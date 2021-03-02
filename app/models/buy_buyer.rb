class BuyBuyer
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number, :user_id, :product_id,
                :token

  POSTALCODE_REGEX = /\A\d{3}-\d{4}\z/.freeze  # 3桁 - 4桁の数字の組み合わせ
  validates :postal_code, presence: true, format: { with: POSTALCODE_REGEX, message: 'Input correctly' }

  with_options presence: true do
    validates :token
    validates :prefectures_id, numericality: { other_than: 1, message: 'Select' }
    validates :municipality
    validates :address
    validates :user_id
    validates :product_id
  end

  

  PHONENUMBER_REGEX = /\A\d{11}\z/.freeze # 11桁以内の数字
  validates :phone_number, presence: true, format: { with: PHONENUMBER_REGEX, message: 'Input only number' }

  def save
    buy = Buy.create(user_id: user_id, product_id: product_id) # 購入情報を保存し、変数buyに代入する
    Buyer.create(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, buy_id: buy.id)     # 購入者住所を保存する   # buy_idには、変数buyのidと指定する
  end
end
