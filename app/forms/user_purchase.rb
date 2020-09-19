class UserPurchase

  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :block, :build, :tel, :user_id, :item_id, :token

  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :token, :postal_code, :area_id, :city, :block, :tel, presence: true
  validates :postal_code, format:{ with: /\A\d{3}[-]\d{4}\z/ }
  validates :area_id, numericality: { other_than: 0, message: 'を選択して下さい' }
  validates :tel, format:{ with: /\A\d{11}\z/ }
  
  def save
  #  item = Item.create(image: image, item_name: item_name, introduction: introduction, category_id: category_id, status_id: status_id, postage_id: postage_id, area_id: area_id, day_id: day_id, price: price,)
    purchase.create(user_id: user_id, item_id: item_id)
    delivery.create(postal_code: postal_code, area_id: area_id,city: city, block: block, build: build, tel: tel, purchase_id: purchase.id)
  end
  
end