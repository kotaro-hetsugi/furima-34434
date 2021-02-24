class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password,format:{with: PASSWORD_REGEX, message:'Include both letters and numbers' }

  with_options presence: true do
    validates :nick_name
    validates :birthday
  end

  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々]+\z/.freeze
  with_options presence: true, format: { with: NAME_REGEX, message: 'Full-width characters' } do
    validates :last_name
    validates :first_name
  end

  NAMEKANA_REGEX = /\A[ァ-ヶ]+\z/.freeze
  with_options presence: true, format: { with: NAMEKANA_REGEX, message: 'Full-width katakana characters' } do
    validates :last_name_kana
    validates :first_name_kana
  end

  has_many :products
  has_many :buys
end
