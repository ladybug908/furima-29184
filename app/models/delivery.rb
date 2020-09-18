class Delivery < ApplicationRecord
  validates :postal_code, :city, :block, :tel, presence: true

  validates :postal_code, format:{ with: /\A\d{3}[-]\d{4}\z/ }

  validates :area_id, numericality: { other_than: 0, message: 'を選択して下さい' }

  validates :tel, format:{ with: /\A\d{11}\z/ }

  belongs_to :purchase
  belongs_to_active_hash :area
end
