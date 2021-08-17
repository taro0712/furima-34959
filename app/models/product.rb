class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shopping_charge
  belongs_to :delivery_area
  belongs_to :delivery_day
  belongs_to :user
  has_one_attached :image
  has_one :purchasehistory

  validates :image, :name, :text, :price,  presence: true
  validates :category_id, :status_id, :shopping_charge_id, :delivery_area_id, :delivery_day_id,
            numericality: { other_than: 1, message: "can't be blank" }
  validates :price, numericality: { only_integer: true, message: 'is invalid. Input half-width characters' }
  validates :price, inclusion: { in: 300..9_999_999, message: 'is out of setting range' }
end
