class Item < ApplicationRecord
  validates :item_name, :introduction, :category_id, :status_id, :postage_id, :area_id, :days_id, :price, presence: true

  validates :item_name, length: { maximum: 40 }
  validates :introduction, length: { maximum: 1000 }

  validates :price, format: { with: /^[0-9]+$/ }
  validates :price, numericality:{ greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
end
