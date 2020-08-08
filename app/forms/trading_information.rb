class TradingInformation
  include ActiveModel::Model
  attr_accessor :postcode, :state_id, :city, :block, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :state_id, numericality: { other_than: 1 }
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A\d{11}\z/ }
  end

  def save
    Trade.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, state_id: state_id, city: city, block: block, building: building, phone_number: phone_number, item_id: item_id)
  end
end