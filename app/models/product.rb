class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee_role
  belongs_to :delivery_source_area
  belongs_to :delivery_days

  with_options presence: true do
  validates :image
  validates :title
  validates :text
  end
  
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_fee_role_id
    validates :delivery_source_area_id
    validates :delivery_days_id
  end

  validates :price, numericality: { only_integer: true, message: 'Half-width number' },
                    inclusion: { in: 300..9_999_999, message: 'Out of setting range' }

  belongs_to :user
  has_one :buy
  has_one_attached :image
end
