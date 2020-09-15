class PurchasesController < ApplicationController
  before_action :move_to_new_user_session , only: :new


  def index
    @purchase = Purchase.new
  end

  def new
    
  end

  def create
    @purchase = Item.create(item_params)
    if @purchase.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
  end

  def move_to_new_user_session
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
