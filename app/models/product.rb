class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee_role
  belongs_to :delivery_source_area
  belongs_to :delivery_days

  validates :image,                   presence: true
  validates :title,                   presence: true
  validates :text,                    presence: true
  validates :category_id,             numericality: { other_than: 1 }
  validates :status_id,               numericality: { other_than: 1 }
  validates :delivery_fee_role_id,    numericality: { other_than: 1 }
  validates :delivery_source_area_id, numericality: { other_than: 1 }
  validates :delivery_days_id,        numericality: { other_than: 1 }
  validates :price, numericality: { only_integer: true, message: 'Half-width number' },
                    inclusion: { in: 300..9_999_999, message: 'Out of setting range' }

  belongs_to :user
  has_one :buy
  has_one_attached :image
end
