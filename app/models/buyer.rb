class Buyer < ApplicationRecord
  with_options presence: true do
    validates :postal_code
    validates :municipality
    validates :address
  end

  validates :prefectures_id, numericality: { other_than: 1 }
  validates :phone_number, numericality: { only_integer: true, message: 'Input only number' }

  belongs_to :buy
end
