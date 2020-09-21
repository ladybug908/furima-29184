class PurchasesController < ApplicationController
  before_action :move_to_new_user_session
  before_action :move_to_root
  before_action :set_item

  def index
    @purchase = UserPurchase.new
  end

  def create
    @purchase = UserPurchase.new(delivery_params)
    if @purchase.valid?
      @purchase.save
      pay_item
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @items = Item.find(params[:item_id])
  end

  def delivery_params
    params.permit(:token, :item_id, :postal_code, :area_id, :city, :block, :build, :tel).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: delivery_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類(日本円)
    )
  end

  def move_to_new_user_session
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_root
    @item = Item.find(params[:item_id])
    redirect_to root_path if user_signed_in? && current_user.id == @item.user_id
  end
end
