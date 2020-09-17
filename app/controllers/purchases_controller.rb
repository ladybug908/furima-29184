class PurchasesController < ApplicationController
    before_action :move_to_new_user_session

    def index
      #@purchase = Purchase.new
      @item = Item.find(params[:item_id])
      #@purchases = @item.purchase.includes(:user)
    end

    def new

    end

     def create
      @purchase = Purchase.new(purchase_params)
  #     @item = Item.find(params[:item_id])
  #     @purchase.save
      if @purchase.valid?
        pay_item
        @purchase.save
        return redirect_to root_path
      else
        render :index
      end
     end

  #   def show

  #   end

     private

    def purchase_params
      params.permit(:token)
    end

    def pay_item
      Payjp.api_key = "sk_test_8afe4dc22ad96bdd04f81ae0"  # PAY.JPテスト秘密鍵
      Payjp::Charge.create(
        amount: order_params[:price],  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency:'jpy'                 # 通貨の種類(日本円)
      )
    end

    def move_to_new_user_session
      unless user_signed_in?
        redirect_to new_user_session_path
      end
    end

end
