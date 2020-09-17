class PurchasesController < ApplicationController
    before_action :move_to_new_user_session , only: :new

    def index
      #@purchase = Purchase.new
      @item = Item.find(params[:item_id])
      #@purchases = @item.purchase.includes(:user)
    end

  #   def new

  #   end

  #   def create
  #     @item = Item.find(params[:item_id])
  #     @purchase = @item.messages.new(purchase_params)
  #     @purchase.save
  #     if @purchase.save
  #       redirect_to root_path
  #     else
  #       @purchases = @item.purchase.includes(:user)
  #       render :index
  #     end
  #   end

  #   def show

  #   end

  #   private

  #  def purchase_params
  #    params.require(:purchase).permit(:hoge).merge(user_id: current_user.id)
  #  end

  #   def move_to_new_user_session
  #     unless user_signed_in?
  #       redirect_to new_user_session_path
  #     end
  #   end
end
