class BuyBuyer
  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_source_area_id, :municipality,  :address, :building_name, :phone_number, :user_id, :product_id 

  with_options presence: true do
    validates :postal_code
    validates :municipality
    validates :address
  end

  validates :prefectures_id, numericality: { other_than: 1 }
  validates :phone_number, numericality: { only_integer: true, message: 'Input only number' }
end