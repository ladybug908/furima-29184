class ItemsController < ApplicationController
  before_action :move_to_new_user_session , only: :new

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private
  def item_params
    params.require(:item).permit(:image, :item_name, :introduction, :category_id, :status_id, :postage_id, :area_id, :day_id, :price).merge(user_id: current_user.id,)
  end

  def move_to_new_user_session
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
