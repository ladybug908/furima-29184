class PurchasesController < ApplicationController
  before_action :move_to_new_user_session
  before_action :move_to_root

  def index
    @purchase = UserPurchase.new
    @item = Item.find(params[:item_id])
 #      @purchases = @item.purchase.includes(:user)
  end

    # def new
    #   @delivery = UserPurchase.new
    # end

  def create
    @item = Item.find(params[:item_id])
    @purchase = UserPurchase.new(delivery_params)
    #      @delivery = UserPurchase.new(delivery_params)
    if @purchase.valid?
      @purchase.save      
      pay_item
      # @delivery.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def delivery_params
    params.permit(:token, :item_id, :postal_code, :area_id,:city, :block, :build, :tel).merge(user_id: current_user.id)
  end

  # def purchase_params
  #   params.permit(:token)
  # end  

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: delivery_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def move_to_new_user_session
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def move_to_root
    @item = Item.find(params[:item_id])
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end

end
