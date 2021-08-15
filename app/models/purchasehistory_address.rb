class PurchasehistoryAddress
  include ActiveModel::Model
  attr_accessor :postcode, :delivery_area_id, :city, :block, :building, :phone_number, :user_id, :product_id, :token

  validates :postcode, :city, :block, :phone_number, :user_id, :product_id, :token, presence: true
  validates :delivery_area_id, numericality: { other_than: 1, message: "can't be blank" }

  validates :postcode, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
  validates :phone_number, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input only number' }
  validates :phone_number, format: { with: /[0-9]{10,11}/, message: 'is too short' }

  def save
    purchasehistory = Purchasehistory.create(user_id: user_id, product_id: product_id)
    Address.create(postcode: postcode, delivery_area_id: delivery_area_id, city: city, block: block, building: building,
                   phone_number: phone_number, purchasehistory_id: purchasehistory.id)
  end
end
