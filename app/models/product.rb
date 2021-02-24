class Product < ApplicationRecord
  validates :image,                   presence: true
  validates :title,                   presence: true
  validates :text,                    presence: true
  validates :category_id,             presence: true
  validates :status_id,               presence: true
  validates :delivery_fee_role_id,    presence: true
  validates :delivery_source_area_id, presence: true
  validates :delivery_days_id,        presence: true
  validates :price,                   presence: true

  belongs_to :user
  has_one :buy
  has_one_attached :image
end
