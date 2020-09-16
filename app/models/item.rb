class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :image, presence: { message: 'をアップロードしてください' }

  validates :item_name, :introduction, presence: true

  validates :item_name, length: { maximum: 40 }
  validates :introduction, length: { maximum: 1000 }

  validates :category_id, :status_id, :postage_id, :area_id, :day_id, numericality: { other_than: 0, message: 'を選択して下さい' }

  with_options presence: true do
    validates :price, format: { with: /\A[0-9]+\z/ }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}
  end

  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :postage
  belongs_to_active_hash :area
  belongs_to_active_hash :day
  has_one_attached :image
end
